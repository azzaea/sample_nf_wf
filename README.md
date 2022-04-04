# Sample workflow in Nextflow

The same workflow is written in DSL-1, and then migrated to DSL 2.

To run:

1. Install Nextflow. Instructions [here](https://www.nextflow.io/)
2. Install Trimmomatic. Instructions [here](http://www.usadellab.org/cms/?page=trimmomatic)
3. You'd also need sample reads. You may use [these](https://digitalinsights.qiagen.com/downloads/example-data/)
4. Adjust the file `nextflow.config` as per your environment. 



Now, you are set! Let's run the workflow:

## Locally:

```
nextflow run trim trim_dsl1.nf -profile standard
```

## Via Slurm

In this case, you need to fill in values in the `nextflow.config` file that relates to your scheduler. Some starting values were put assuming `slurm` resource manager, but you still need to use the name of your actual queue ... etc

Then, invoke it as:
```
nextflow run trim trim_dsl1.nf -profile cluster
```

Either case, output files will be saved in the directory `TrimOut` :)


 
