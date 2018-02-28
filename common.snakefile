configfile: "config.yaml"

targets = []
for reference in config['references']:
    for sample in config['references'][reference]['samples']:
        targets.extend(
            expand(
                'data/consensus/{reference}/{sample}/{sample}_consensus.fasta',
                sample=sample,
                reference=reference
            )
        )
        targets.extend(
            expand(
                'data/coverage/{reference}/{sample}/{sample}',
                sample=sample,
                reference=reference
            )
        )
        
rule all:
    input:
        targets
