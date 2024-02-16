


Create `input` directory & then write some silly text into ten log files, we will use these log files as input for our pipeline
```
mkdir input
cd input
touch test{0001..0010}.log
echo "just some random text" | tee -a *.log
```
Final structure of project directory \

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
