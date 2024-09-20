### 6.CALC ###

# Set INDIV name
# e.g., INDIV=Bossou_FF45

# Start CALC

# exclude indels

vcftools --vcf ${INDIV}_snpEff.vcf --remove-indels --recode --recode-INFO-all --out ${INDIV}_snpEff_SNPs


# count

grep '^#' ${INDIV}_snpEff.vcf > ${INDIV}_snpEff.vcf.header
grep -v '^#' ${INDIV}_snpEff.vcf > ${INDIV}_snpEff.vcf.body

grep -v '^#' ${INDIV}_snpEff_SNPs.recode.vcf > ${INDIV}_snpEff_SNPs.recode.vcf.body
grep -v '\./\.:\|\.|\.:' ${INDIV}_snpEff_SNPs.recode.vcf.body > ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned
grep '\./\.:\|\.|\.:' ${INDIV}_snpEff_SNPs.recode.vcf.body > ${INDIV}_snpEff_SNPs.recode.vcf.body.unassigned

echo 'CHECK'
grep '\./\.\|\.|\.' ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned

echo 'CHECK'
grep -v '0/0:\|0|0:\|0/1:\|0|1:\|1/1:\|1|1:\|1/2:\|1|2:' ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned

echo 'No of sites (all)'
wc -l ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned


# chromosomes

grep '^1\|^2\|^3\|^4\|^5\|^6\|^7\|^8\|^9' ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned > ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrA
grep '^X' ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned > ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrX
grep '^Y' ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned > ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrY
grep '^MT' ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned > ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.MT

cat ${INDIV}_snpEff.vcf.header ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrA > ${INDIV}_snpEff_SNPs.chrA.vcf
cat ${INDIV}_snpEff.vcf.header ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrX > ${INDIV}_snpEff_SNPs.chrX.vcf
cat ${INDIV}_snpEff.vcf.header ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrY > ${INDIV}_snpEff_SNPs.chrY.vcf
cat ${INDIV}_snpEff.vcf.header ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.MT > ${INDIV}_snpEff_SNPs.MT.vcf

grep '0/0:\|0|0:\|1/1:\|1|1:' ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrA > ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrA.homo
grep '0/0:\|0|0:\|1/1:\|1|1:' ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrX > ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrX.homo
grep '0/0:\|0|0:\|1/1:\|1|1:' ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrY > ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrY.homo

grep '0/1:\|0|1:\|1/2:\|1|2:' ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrA > ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrA.hetero
grep '0/1:\|0|1:\|1/2:\|1|2:' ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrX > ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrX.hetero
grep '0/1:\|0|1:\|1/2:\|1|2:' ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrY > ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrY.hetero

echo 'No of sites (chr)'
wc -l ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrA.homo
wc -l ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrX.homo
wc -l ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrY.homo
wc -l ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrA.hetero
wc -l ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrX.hetero
wc -l ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrY.hetero


# chrA amino acids

grep '0/0:\|0|0:' ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrA > ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrA.nomutation

grep 'missense_variant' ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrA | grep '0/1:\|0|1:\|1/2:\|1|2:' > ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrA.missense.hetero
grep 'missense_variant' ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrA | grep '1/1:\|1|1:' > ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrA.missense.homo

grep 'synonymous_variant' ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrA | grep '0/1:\|0|1:\|1/2:\|1|2:' > ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrA.synonymous.hetero
grep 'synonymous_variant' ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrA | grep '1/1:\|1|1:' > ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrA.synonymous.homo

grep 'missense_variant' ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrA | grep 'synonymous_variant' | grep '0/1:\|0|1:\|1/2:\|1|2:' > ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrA.misANDsyn.hetero
grep 'missense_variant' ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrA | grep 'synonymous_variant' | grep '1/1:\|1|1:' > ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrA.misANDsyn.homo

echo 'No. of sites (chrA)'
wc -l ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrA.missense.hetero
wc -l ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrA.synonymous.hetero
wc -l ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrA.misANDsyn.hetero


# chrX amino acids

grep '0/0:\|0|0:' ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrX > ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrX.nomutation

grep 'missense_variant' ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrX | grep '0/1:\|0|1:\|1/2:\|1|2:' > ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrX.missense.hetero
grep 'missense_variant' ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrX | grep '1/1:\|1|1:' > ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrX.missense.homo

grep 'synonymous_variant' ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrX | grep '0/1:\|0|1:\|1/2:\|1|2:' > ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrX.synonymous.hetero
grep 'synonymous_variant' ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrX | grep '1/1:\|1|1:' > ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrX.synonymous.homo

grep 'missense_variant' ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrX | grep 'synonymous_variant' | grep '0/1:\|0|1:\|1/2:\|1|2:' > ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrX.misANDsyn.hetero
grep 'missense_variant' ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrX | grep 'synonymous_variant' | grep '1/1:\|1|1:' > ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrX.misANDsyn.homo

echo 'No. of sites (chrX)'
wc -l ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrX.missense.hetero
wc -l ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrX.synonymous.hetero
wc -l ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrX.misANDsyn.hetero


# chrY amino acids

grep '0/0:\|0|0:' ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrY > ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrY.nomutation

grep 'missense_variant' ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrY | grep '0/1:\|0|1:\|1/2:\|1|2:' > ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrY.missense.hetero
grep 'missense_variant' ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrY | grep '1/1:\|1|1:' > ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrY.missense.homo

grep 'synonymous_variant' ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrY | grep '0/1:\|0|1:\|1/2:\|1|2:' > ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrY.synonymous.hetero
grep 'synonymous_variant' ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrY | grep '1/1:\|1|1:' > ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrY.synonymous.homo

grep 'missense_variant' ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrY | grep 'synonymous_variant' | grep '0/1:\|0|1:\|1/2:\|1|2:' > ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrY.misANDsyn.hetero
grep 'missense_variant' ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrY | grep 'synonymous_variant' | grep '1/1:\|1|1:' > ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrY.misANDsyn.homo

echo 'No. of sites (chrY)'
wc -l ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrY.missense.hetero
wc -l ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrY.synonymous.hetero
wc -l ${INDIV}_snpEff_SNPs.recode.vcf.body.assigned.chrY.misANDsyn.hetero


# pseudogenes

grep 'frameshift_variant' ${INDIV}_snpEff.vcf.body > ${INDIV}_snpEff.vcf.body.frameshift_variant
grep 'start_lost' ${INDIV}_snpEff.vcf.body > ${INDIV}_snpEff.vcf.body.start_lost
grep 'stop_gained' ${INDIV}_snpEff.vcf.body > ${INDIV}_snpEff.vcf.body.stop_gained

echo 'No. of pseudogenes (all)'
wc -l ${INDIV}_snpEff.vcf.body.frameshift_variant
wc -l ${INDIV}_snpEff.vcf.body.start_lost
wc -l ${INDIV}_snpEff.vcf.body.stop_gained


# bgzip & tabix

bgzip ${INDIV}_snpEff_SNPs.chrA.vcf
bgzip ${INDIV}_snpEff_SNPs.chrX.vcf
bgzip ${INDIV}_snpEff_SNPs.chrY.vcf
bgzip ${INDIV}_snpEff_SNPs.MT.vcf

tabix ${INDIV}_snpEff_SNPs.chrA.vcf.gz
tabix ${INDIV}_snpEff_SNPs.chrX.vcf.gz
tabix ${INDIV}_snpEff_SNPs.chrY.vcf.gz
tabix ${INDIV}_snpEff_SNPs.MT.vcf.gz
