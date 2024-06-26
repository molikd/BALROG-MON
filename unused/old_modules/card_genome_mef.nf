process card_genome_mef {
   label 'lowmem'
    container 'library://edwardbird/bara/rgi:5.1.1'
    publishDir "${params.project_name}/AMR_Annotation/CARD_genome_mef", mode: 'copy', overwrite: false

    input:
        tuple val(sample), file(fasta)
        tuple val(db_name), path(db)
    output:
        path("./${sample}"), emit: card_genome_results

    script:

    """
    mkdir ${sample}
    rgi main --input_sequence $fasta --output_file ./${sample}/${sample}_out --input_type contig --local --clean
    """
}