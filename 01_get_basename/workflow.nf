#!/usr/bin/env nextflow
nextflow.enable.dsl=2

//  Module path must start with / or ./ prefix -- Offending module: $baseDir/modules/get_base.nf
// Module path doesn't like $baseDir

include {TOUCH} from './modules/get_base.nf'

Channel
  .fromPath("$baseDir/input/*log", checkIfExists:true)
  .set{x_file}

workflow {
    TOUCH(x_file)
}
