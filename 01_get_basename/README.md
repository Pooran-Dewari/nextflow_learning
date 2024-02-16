### What does this pipeline do?
This pipeline takes .log files as input, reads the contents, converts text into upper case, and writes them into .text files in `results` directory.
Main idea is to extract the basename from .log files and use the `basename` when outputting .txt files.

### Prepare files
- Clone the contents of this directory (modules, workflow.nf, nextflow executable)
- Create `input` directory & then write some silly text into ten log files, we will use these log files as input for our pipeline
```
mkdir input
cd input
touch test{0001..0010}.log
echo "just some random text" | tee -a *.log
```
Final structure of project directory

├── input \
│   ├── test0001.log \
│   ├── test0002.log \
│   ├── test0003.log \
│   ├── test0004.log \
│   ├── test0005.log \
│   ├── test0006.log \
│   ├── test0007.log \
│   ├── test0008.log \
│   ├── test0009.log \
│   └── test0010.log \
├── modules \
│   └── get_base.nf \
├── nextflow \
└── workflow.nf

Here is a quick view of log files contents 
```
$ cat input/*log
#just some random text
#just some random text
#just some random text
#just some random text
#just some random text
#just some random text
#just some random text
#just some random text
#just some random text
#just some random text
```
### Run nextflow pipeline

```
./nextflow run workflow.nf
```
Directory structure after the successful completion of the pipeline as follows, note we have two new directories:
- `results` with .txt files, one file for each .log input file
- `work` directory, this has 10 subdirectories, one for each process of .log -> .txt.
```
├── input
│   ├── test0001.log
│   ├── test0002.log
│   ├── test0003.log
│   ├── test0004.log
│   ├── test0005.log
│   ├── test0006.log
│   ├── test0007.log
│   ├── test0008.log
│   ├── test0009.log
│   └── test0010.log
├── modules
│   └── get_base.nf
├── nextflow
├── results
│   ├── test0001.txt
│   ├── test0002.txt
│   ├── test0003.txt
│   ├── test0004.txt
│   ├── test0005.txt
│   ├── test0006.txt
│   ├── test0007.txt
│   ├── test0008.txt
│   ├── test0009.txt
│   └── test0010.txt
├── work
│   ├── 3a
│   │   └── 0db85c6cfa34875cce8e909a59175f
│   │       ├── test0004.log -> /exports/eddie/scratch/pdewari/next_learn/input/test0004.log
│   │       └── test0004.txt
│   ├── 72
│   │   └── 768c2346545f5c7e7777baf6b9169f
│   │       ├── test0006.log -> /exports/eddie/scratch/pdewari/next_learn/input/test0006.log
│   │       └── test0006.txt
│   ├── 8a
│   │   └── d38a92c16c4cea89a2ef1e8478ac36
│   │       ├── test0005.log -> /exports/eddie/scratch/pdewari/next_learn/input/test0005.log
│   │       └── test0005.txt
│   ├── 91
│   │   └── e8e19f9c04116923a306c0f397adb3
│   │       ├── test0007.log -> /exports/eddie/scratch/pdewari/next_learn/input/test0007.log
│   │       └── test0007.txt
│   ├── 92
│   │   └── aa953474fee57a86d5297dd99a894a
│   │       ├── test0008.log -> /exports/eddie/scratch/pdewari/next_learn/input/test0008.log
│   │       └── test0008.txt
│   ├── 93
│   │   └── 486cf817094238673290e55f063b64
│   │       ├── test0009.log -> /exports/eddie/scratch/pdewari/next_learn/input/test0009.log
│   │       └── test0009.txt
│   ├── a2
│   │   └── 95f59750e10d65e6f821263d0dbf3d
│   │       ├── test0003.log -> /exports/eddie/scratch/pdewari/next_learn/input/test0003.log
│   │       └── test0003.txt
│   ├── ab
│   │   └── 71d3c5f8936d18063d196c40b0871e
│   │       ├── test0001.log -> /exports/eddie/scratch/pdewari/next_learn/input/test0001.log
│   │       └── test0001.txt
│   ├── c0
│   │   └── b84d61199d810e42e2523bee51b077
│   │       ├── test0010.log -> /exports/eddie/scratch/pdewari/next_learn/input/test0010.log
│   │       └── test0010.txt
│   └── e7
│       └── b77247a926a13874a054bcd585306b
│           ├── test0002.log -> /exports/eddie/scratch/pdewari/next_learn/input/test0002.log
│           └── test0002.txt
└── workflow.nf
```

And here is a quick look at output files in results directory
```
$ cat results/*txt
#JUST SOME RANDOM TEXT
#JUST SOME RANDOM TEXT
##JUST SOME RANDOM TEXT
#JUST SOME RANDOM TEXT
#JUST SOME RANDOM TEXT
#JUST SOME RANDOM TEXT
#JUST SOME RANDOM TEXT
#JUST SOME RANDOM TEXT
#JUST SOME RANDOM TEXT
#JUST SOME RANDOM TEXT

```

