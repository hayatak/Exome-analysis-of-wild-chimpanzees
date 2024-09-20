
### 3.GATK ###

# Set INDIV name
# e.g., INDIV=Bossou_FF45

INDIV=

# Start GATK (use v4.2.0.0)

gatk --java-options "-Xmx64G -Xms64G" \
MarkDuplicates \
-I ${INDIV}_mem_paired_merged_sorted.bam \
-O ${INDIV}_mem_paired_merged_sorted_markdup.bam \
-M ${INDIV}_mem_paired_merged_sorted_markdup_metrics.txt

samtools index ${INDIV}_mem_paired_merged_sorted_markdup.bam
samtools idxstats ${INDIV}_mem_paired_merged_sorted_markdup.bam > ${INDIV}_mem_paired_merged_sorted_markdup.out

gatk --java-options "-Xmx64G -Xms64G" \
BaseRecalibrator \
-I ${INDIV}_mem_paired_merged_sorted_markdup.bam \
-R Pan_troglodytes.Pan_tro_3.0.dna.toplevel.fa \
--known-sites pan_troglodytes.vcf \
-O ${INDIV}_mem_paired_merged_sorted_markdup_recal_data.table

gatk --java-options "-Xmx64G -Xms64G" \
AnalyzeCovariates \
-bqsr ${INDIV}_mem_paired_merged_sorted_markdup_recal_data.table \
-plots ${INDIV}_mem_paired_merged_sorted_markdup_AnalyzeCovariates.pdf

gatk --java-options "-Xmx64G -Xms64G" \
ApplyBQSR \
-I ${INDIV}_mem_paired_merged_sorted_markdup.bam \
-R Pan_troglodytes.Pan_tro_3.0.dna.toplevel.fa \
--bqsr-recal-file ${INDIV}_mem_paired_merged_sorted_markdup_recal_data.table \
-O ${INDIV}_mem_paired_merged_sorted_markdup_BQSR.bam

gatk --java-options "-Xmx64G -Xms64G" \
BaseRecalibrator \
-I ${INDIV}_mem_paired_merged_sorted_markdup_BQSR.bam \
-R Pan_troglodytes.Pan_tro_3.0.dna.toplevel.fa \
--known-sites pan_troglodytes.vcf \
-O ${INDIV}_mem_paired_merged_sorted_markdup_BQSR_recal_data.table

gatk --java-options "-Xmx64G -Xms64G" \
AnalyzeCovariates \
-before ${INDIV}_mem_paired_merged_sorted_markdup_recal_data.table \
-after ${INDIV}_mem_paired_merged_sorted_markdup_BQSR_recal_data.table \
-plots ${INDIV}_mem_paired_merged_sorted_markdup_BQSR_AnalyzeCovariates.pdf

samtools idxstats ${INDIV}_mem_paired_merged_sorted_markdup_BQSR.bam > ${INDIV}_mem_paired_merged_sorted_markdup_BQSR.out

gatk --java-options "-Xmx64G -Xms64G" \
HaplotypeCaller \
-I ${INDIV}_mem_paired_merged_sorted_markdup_BQSR.bam \
-R Pan_troglodytes.Pan_tro_3.0.dna.toplevel.fa \
--intervals Pan_tro_3.0.105_cds_sorted_merged.bed \
--output-mode EMIT_ALL_ACTIVE_SITES \
-ERC BP_RESOLUTION \
-O ${INDIV}.g.vcf.gz

gatk --java-options "-Xmx64G -Xms64G" \
GenotypeGVCFs \
-R Pan_troglodytes.Pan_tro_3.0.dna.toplevel.fa \
-V ${INDIV}.g.vcf.gz \
--include-non-variant-sites \
-O ${INDIV}.vcf.gz
