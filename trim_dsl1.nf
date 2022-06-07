/*****************************************************************************************/
/*                                                                                       */
/*              This Nextflow script trims the Inputs Fasta File using Trimmomatic       */
/*                                                                                       */
/*****************************************************************************************/



trimmomaticjar = file(params.trimmomaticjar)
InputRead1 = file(params.InputRead1)
InputRead2 = file(params.InputRead2)
Threads = params.Threads
SampleName = params.SampleName
adapters = file(params.adapters)

process TrimSequences {
   publishDir params.TrimOut
   module params.javaModule
   input:
      file trimmomaticjar          // path to trimmomatic.jar
      file InputRead1              // Input Read File 
      file InputRead2             // Input Read File            
      val Threads                  // Number of threads
      val SampleName               // Name of the Sample
      file adapters

   output:
      tuple file("${SampleName}.read1_paired.fq.gz"), file("${SampleName}.read2_paired.fq.gz") into trimmedFiles

   script:
      """
      java -jar $trimmomaticjar PE -threads $Threads $InputRead1 $InputRead2 ${SampleName}.read1_paired.fq.gz ${SampleName}.read1_unpaired.fq.gz ${SampleName}.read2_paired.fq.gz ${SampleName}.read2_unpaired.fq.gz ILLUMINACLIP:${adapters}:2:30:10:2:True LEADING:3 TRAILING:3 MINLEN:36
      """
}

