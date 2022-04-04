/*****************************************************************************************/
/*                                                                                       */
/*              This Nextflow script trims the Inputs Fasta File using Trimmomatic       */
/*                                                                                       */
/*****************************************************************************************/

nextflow.enable.dsl=2

include { TrimSequences } from './modules.nf'

trimmomaticjar = file(params.trimmomaticjar)
InputRead1 = file(params.InputRead1)
InputRead2 = file(params.InputRead2)
Threads = params.Threads
SampleName = params.SampleName
adapters = file(params.adapters)

workflow {
  take:
   
  main:
    TrimSequences()
  emit:
    TrimSequences.out
}
