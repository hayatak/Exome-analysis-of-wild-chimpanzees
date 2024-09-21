### 5.SNPEFF ###

# Set INDIV name
# e.g., INDIV=Bossou_FF45

INDIV=

# Start SNPEFF

java -Xmx64G -Xms64G -jar snpEff.jar \
-stats ${INDIV}_snpEff_report.html \
Pan_tro_3.0.105 ${INDIV}.vcf.gz \
 > ${INDIV}_snpEff.vcf
