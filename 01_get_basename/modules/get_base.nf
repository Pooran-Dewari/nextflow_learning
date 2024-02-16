#!/usr/bin/env nextflow

process TOUCH {
  debug true

// ouput files will be saved to results dir

  publishDir 'results', mode: 'copy', overwrite: false

  input:
  path some_file

  output:
  path "${some_file.baseName}.txt"

  script:
  """
  cat $some_file | tr 'a-z' 'A-Z' > "${some_file.baseName}.txt"
  """
}
