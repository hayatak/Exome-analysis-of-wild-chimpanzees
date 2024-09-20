
### 1.TRIM ###

# Set library IDs in A, B, C, D,...
# e.g., A=DRR547528, B=DRR547529

A=
B=

# Set INDIV name
# e.g., INDIV=Bossou_FF45

INDIV=

# Set sequencing length
# e.g., LENGTH=150 when 151 cycles

LENGTH=

# Set the number of threads

THREADS=

# Start trim

for i in ${A} ${B}

do

trimmomatic \
PE \
-threads ${THREADS} \
${i}_1.fastq.gz \
${i}_2.fastq.gz \
${INDIV}_${i}_fw_paired_crop.fastq \
${INDIV}_${i}_fw_unpaired_crop.fastq \
${INDIV}_${i}_re_paired_crop.fastq \
${INDIV}_${i}_re_unpaired_crop.fastq \
CROP:${LENGTH}

skewer \
${INDIV}_${i}_fw_paired_crop.fastq \
${INDIV}_${i}_re_paired_crop.fastq \
-m pe \
-l 50 \
-o ${INDIV}_${i} \
-t ${THREADS}

rm ${INDIV}_${i}_fw_paired_crop.fastq
rm ${INDIV}_${i}_fw_unpaired_crop.fastq
rm ${INDIV}_${i}_re_paired_crop.fastq
rm ${INDIV}_${i}_re_unpaired_crop.fastq

trimmomatic \
PE \
-threads ${THREADS} \
${INDIV}_${i}-trimmed-pair1.fastq \
${INDIV}_${i}-trimmed-pair2.fastq \
${INDIV}_${i}_fw_paired_trimmed.fastq \
${INDIV}_${i}_fw_unpaired_trimmed.fastq \
${INDIV}_${i}_re_paired_trimmed.fastq \
${INDIV}_${i}_re_unpaired_trimmed.fastq \
LEADING:20 \
TRAILING:20 \
SLIDINGWINDOW:4:20 \
MINLEN:50

rm ${INDIV}_${i}-trimmed-pair1.fastq
rm ${INDIV}_${i}-trimmed-pair2.fastq
rm ${INDIV}_${i}_fw_unpaired_trimmed.fastq
rm ${INDIV}_${i}_re_unpaired_trimmed.fastq

done
