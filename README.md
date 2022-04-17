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
nextflow run trim_dsl1.nf -profile standard # Or,
nextflow run trim_dsl2.nf -profile standard
```

## Via Slurm

In this case, you need to fill in values in the `nextflow.config` file that relates to your scheduler. Some starting values were put assuming `slurm` resource manager, but you still need to use the name of your actual queue ... etc

Then, invoke it as:
```
nextflow run trim_dsl1.nf -profile cluster
nextflow run trim_dsl2.nf -profile cluster
```

Either case, output files will be saved in the directory `TrimOut` :)


# Note on DSL1 vs DSL2:

DSL1 is the nextflow syntax that is typically found in many public workflows. It is very mature (starting ~ 2016). 
DSL2 is the syntax with supperior support for modularity (via reusable components (as both processes and complete workflows). As such, it lends itself to more readable code, and possibilities for many complex nested patterns. However, this effort is lagging (slightly) in development (compared with DSL1). Yet, some nf-core workflows have successfully migrated to DSL2. 

For the workflow at hand, here are the changes made to move from DSL1 to DSL2 code:
1. I put the `process` definition in its own file, `modules.nf`. This could easily be a library of such modules that are imported as need may be in the main script file: `trim_dsl2.nf`.
2. Both files start with `nextflow.enable.dsl=2`
2. In the process definition, `file` identifiers have been replaced with `path` identifiers. That's it.
3. In the workflow file, `trim_dsl2.nf`, there are: 1) inclusion of needed modules, 2) the input parameter definitions (exactly as they are in `trim_dsl.nf`, and 3) a workflow block that calls the process
4. Notice that parameters are positional (note the different spelling of `trimmomaticjar` in the `module.nf` and `trim_dsl2.nf` files. Refer to this [issue](https://github.com/nextflow-io/nextflow/issues/1694) for how to handle optional inputs
5. Also notice that the `publishDir` parameter has been passed directly from `nextflow.conf` without explicit definition in the worflow body of `trim_dsl2.nf`.
  
There is more to DSL2, including the use of pipes and functions. The documentation [here](https://www.nextflow.io/docs/latest/dsl2.html) is helpful to put it in perspective. (To me, being familiar with DSL1 made it easier to follow along). [This](https://antunderwood.gitlab.io/bioinformant-blog/posts/building_a_dsl2_pipeline_in_nextflow/) is also an excellent blog

