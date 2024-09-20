### 7.VCFMERGE ###

# Start VCFMERGE

for CHR in chrA chrX chrY MT

do

bcftools merge --output-type z \
Bossou_FF45/Bossou_FF45_snpEff_SNPs.${CHR}.vcf.gz \
Bossou_FLE8/Bossou_FLE8_snpEff_SNPs.${CHR}.vcf.gz \
Bossou_JJ3/Bossou_JJ3_snpEff_SNPs.${CHR}.vcf.gz \
Bossou_PE51/Bossou_PE51_snpEff_SNPs.${CHR}.vcf.gz \
Bossou_JR48/Bossou_JR48_snpEff_SNPs.${CHR}.vcf.gz \
PRI_Gon/PRI_Gon_snpEff_SNPs.${CHR}.vcf.gz \
PRI_Puchi/PRI_Puchi_snpEff_SNPs.${CHR}.vcf.gz \
PRI_Reiko/PRI_Reiko_snpEff_SNPs.${CHR}.vcf.gz \
PRI_Chloe/PRI_Chloe_snpEff_SNPs.${CHR}.vcf.gz \
PRI_Pan/PRI_Pan_snpEff_SNPs.${CHR}.vcf.gz \
PRI_Popo/PRI_Popo_snpEff_SNPs.${CHR}.vcf.gz \
PRI_Reo/PRI_Reo_snpEff_SNPs.${CHR}.vcf.gz \
PRI_Cleo/PRI_Cleo_snpEff_SNPs.${CHR}.vcf.gz \
PRI_Pal/PRI_Pal_snpEff_SNPs.${CHR}.vcf.gz \
Mahale_BB70/Mahale_BB70_snpEff_SNPs.${CHR}.vcf.gz \
Mahale_DW77/Mahale_DW77_snpEff_SNPs.${CHR}.vcf.gz \
Mahale_TD59/Mahale_TD59_snpEff_SNPs.${CHR}.vcf.gz \
Mahale_PF41/Mahale_PF41_snpEff_SNPs.${CHR}.vcf.gz \
Kalinzu_Goku28B/Kalinzu_Goku28B_snpEff_SNPs.${CHR}.vcf.gz \
Kalinzu_Ichiro24B/Kalinzu_Ichiro24B_snpEff_SNPs.${CHR}.vcf.gz \
Kalinzu_Jo36A/Kalinzu_Jo36A_snpEff_SNPs.${CHR}.vcf.gz \
Kalinzu_Marute25B/Kalinzu_Marute25B_snpEff_SNPs.${CHR}.vcf.gz \
Kalinzu_Pinka20A/Kalinzu_Pinka20A_snpEff_SNPs.${CHR}.vcf.gz \
Kalinzu_Yoji10A/Kalinzu_Yoji10A_snpEff_SNPs.${CHR}.vcf.gz \
Kalinzu_Yoshiko23B/Kalinzu_Yoshiko23B_snpEff_SNPs.${CHR}.vcf.gz \
Gombe_7057/Gombe_7057_snpEff_SNPs.${CHR}.vcf.gz \
Gombe_7069/Gombe_7069_snpEff_SNPs.${CHR}.vcf.gz \
Gombe_7072/Gombe_7072_snpEff_SNPs.${CHR}.vcf.gz \
Gombe_7150/Gombe_7150_snpEff_SNPs.${CHR}.vcf.gz \
Gombe_7323/Gombe_7323_snpEff_SNPs.${CHR}.vcf.gz \
Gombe_7365/Gombe_7365_snpEff_SNPs.${CHR}.vcf.gz \
Gombe_7433/Gombe_7433_snpEff_SNPs.${CHR}.vcf.gz \
Gombe_7507/Gombe_7507_snpEff_SNPs.${CHR}.vcf.gz \
Gombe_7535/Gombe_7535_snpEff_SNPs.${CHR}.vcf.gz \
Gombe_7650/Gombe_7650_snpEff_SNPs.${CHR}.vcf.gz \
Kibale_LR10/Kibale_LR10_snpEff_SNPs.${CHR}.vcf.gz \
Kibale_LR11/Kibale_LR11_snpEff_SNPs.${CHR}.vcf.gz \
Kibale_LR12/Kibale_LR12_snpEff_SNPs.${CHR}.vcf.gz \
Kibale_LR13/Kibale_LR13_snpEff_SNPs.${CHR}.vcf.gz \
Kibale_LR14/Kibale_LR14_snpEff_SNPs.${CHR}.vcf.gz \
Kibale_LR15/Kibale_LR15_snpEff_SNPs.${CHR}.vcf.gz \
Kibale_match1/Kibale_match1_snpEff_SNPs.${CHR}.vcf.gz \
Loango_LR1/Loango_LR1_snpEff_SNPs.${CHR}.vcf.gz \
Loango_LR2/Loango_LR2_snpEff_SNPs.${CHR}.vcf.gz \
Loango_LR3/Loango_LR3_snpEff_SNPs.${CHR}.vcf.gz \
Loango_LR4/Loango_LR4_snpEff_SNPs.${CHR}.vcf.gz \
Loango_LR5/Loango_LR5_snpEff_SNPs.${CHR}.vcf.gz \
Loango_LR6/Loango_LR6_snpEff_SNPs.${CHR}.vcf.gz \
Loango_LR7/Loango_LR7_snpEff_SNPs.${CHR}.vcf.gz \
Loango_LR8/Loango_LR8_snpEff_SNPs.${CHR}.vcf.gz \
Loango_LR9/Loango_LR9_snpEff_SNPs.${CHR}.vcf.gz \
 > Pan_exomes_all_chimp/Pan_exomes_all_chimp_${CHR}.vcf.gz

tabix Pan_exomes_all_chimpanzee/Pan_exomes_all_chimpanzee_${CHR}.vcf.gz

done
