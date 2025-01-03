### 2.MAPPING ###

# Set library IDs in A, B, C, D,...
# e.g., A=DRR547528, B=DRR547529

A=
B=

# Set INDIV name
# e.g., INDIV=Bossou_FF45

INDIV=

# Set the number of threads

THREADS=

# Start mapping

for i in ${A} ${B}

do

### -R in bwa mem should be edited directly (e.g., Bossou_FF45) ###

bwa mem \
-t ${THREADS} \
-R '@RG\tID:exome_Bossou_FF45\tSM:Bossou_FF45\tPL:ILLUMINA\tLB:Bossou_FF45' \
Pan_troglodytes.Pan_tro_3.0.dna.toplevel.fa \
${INDIV}_${i}_fw_paired_trimmed.fastq \
${INDIV}_${i}_re_paired_trimmed.fastq \
 > ${INDIV}_${i}_mem_paired.sam

rm ${INDIV}_${i}_fw_paired_trimmed.fastq
rm ${INDIV}_${i}_re_paired_trimmed.fastq

samtools view -@ ${THREADS} -bS ${INDIV}_${i}_mem_paired.sam > ${INDIV}_${i}_mem_paired.bam
rm ${INDIV}_${i}_mem_paired.sam

samtools sort -@ ${THREADS} ${INDIV}_${i}_mem_paired.bam -T temp_${INDIV} -o ${INDIV}_${i}_mem_paired_sorted.bam
rm ${INDIV}_${i}_mem_paired.bam

samtools index -@ ${THREADS} ${INDIV}_${i}_mem_paired_sorted.bam
samtools idxstats -@ ${THREADS} ${INDIV}_${i}_mem_paired_sorted.bam > ${INDIV}_${i}_mem_paired_sorted.out

done

### Please add ${C}, ${D},... if the number of libraries is more than two ###

samtools merge \
-@ ${THREADS} \
${INDIV}_mem_paired_merged.bam \
${INDIV}_${A}_mem_paired_sorted.bam \
${INDIV}_${B}_mem_paired_sorted.bam

samtools sort -@ ${THREADS} ${INDIV}_mem_paired_merged.bam -T temp_${INDIV} -o ${INDIV}_mem_paired_merged_sorted.bam

rm ${INDIV}_mem_paired_merged.bam

samtools index -@ ${THREADS} ${INDIV}_mem_paired_merged_sorted.bam
samtools idxstats -@ ${THREADS} ${INDIV}_mem_paired_merged_sorted.bam > ${INDIV}_mem_paired_merged_sorted.out
