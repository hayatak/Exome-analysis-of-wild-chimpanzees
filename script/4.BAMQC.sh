

qualimap bamqc \
-bam ${INDIV}_mem_paired_merged_sorted_markdup_BQSR.bam \
-outdir ${INDIV}_mem_paired_merged_sorted_markdup_BQSR_bamqc \
--feature-file Pan_tro_3.0.105_cds_sorted_merged_bed6.bed \
-c -nt 8 --collect-overlap-pairs --skip-duplicated --skip-dup-mode 0
