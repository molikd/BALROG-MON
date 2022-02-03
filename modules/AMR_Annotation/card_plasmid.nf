process card_plasmid {
    container 'quay.io/biocontainers/rgi:5.1.1--py_0'
    publishDir "${params.project_name}/CARD_plasmid", mode: 'copy', overwrite: false

    input:
        tuple val(sample), file(fasta)
        path(db)
    output:
        path("./${sample}"), emit: card_plasmid_results

    script:

    """
    mkdir ${sample}
    rgi main --input_sequence $fasta --output_file ./${sample}/${sample}_out --input_type contig --local --clean
    """
}