/*****************************************************************************************/
/*                                                                                       */
/*              This Nextflow script trims the Inputs Fasta File using Trimmomatic       */
/*                                                                                       */
/*****************************************************************************************/

nextflow.enable.dsl=2

include { TrimSequences } from './modules.nf'

TrimomaticJar = file(params.trimmomaticjar)
InputRead1 = file(params.InputRead1)
InputRead2 = file(params.InputRead2)
Threads = params.Threads
SampleName = params.SampleName
adapters = file(params.adapters)

workflow {
    TrimSequences(TrimomaticJar, InputRead1, InputRead2, Threads, SampleName, adapters)
}
