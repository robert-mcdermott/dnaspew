# DNASpew 

### Generate random DNA sequences for fun and benchmarking storage systems 

This is just a simple utility to very quickly generate random blocks of fake DNA sequences for testing storage systems (performance, compression/de-dupe rates or just filling up your disks). The Nim source code is provided in the /src directory, or you can just use the precompiled binaries availible under /bin.

Here is the basic usage information:

```
Usage: dnaspew [ --block-size=<int> (default: 1024)
                 --block-count=<int> (default: 1)
                 --width=<int> (default: 64)
                 --full-random (default: false)
                 --benchmark (default: false)
                 --help ]
```

If you provide no arguments, it will just spew 1 block of 1KiB of sequence text (64 chars wide) to the standard output like the following:

```
./dnaspew

TGCGAACCTCCGCCCGAGTGATGCATCTCCGTTTAATTCCAGTATGACACAGTGTAGGCAGCC
CGCTCGCCCCATGGACACTTGAGTAAGCTGCCGTAATGGTATCTTACGTACCCGTCATCGTCA
ATGAGCCTACTGGAACACCGTACGAATTCTGCTTCTAGCGGACATAAAGAATTCATGATGCCA
CCCCGAAAGCAGAATCGGAGGGTGCGGTACATCATGAGCTGATTAGCCGGACCCTGGTTATCA
TTGGCTGGGAAATTCCGTTTTATACCCCGCAAATTGGCACCTGCGACTCTCTGTGATATTGGG
TTCATCCGCTTCACTGGACATTGGGTGTCAAGCGTGATTCAATCAGACACCGTACTACTTGTC
GAAGAATAAGACAACTATCTGCGGATAACTCATAATCTCAGGTAGCTCTGGCCCTCAGTCCCG
AATGAGGCCGGGAGGCGAATAACGTTTAAGGAGACTCGTGTCATAAGTACGAACCTTTCGCCG
CGCAGAACCCTCAAACGACATTAATCTGGCCCGAGTGATCTCCTTTAACACAAGCTCACTATC
ATAGCTTGAGATGGTTTTAGTCTAACCTTACCAATCGTGTTAGAATCCAGCGCGCTTCGTTTG
CAGACATCTTATGTTGACCTGGGTTCGTGCACTTAAATTCCTACCGAACAGAGCGAACTGCCG
CATGGCCGCCCTTGTGTACTCATGTCAGTCCACCACACGTGAAGATTTGGAAGTTAAGTAGCT
CACTAGCGTTAGGAGCTTTTCAAACAATGACAGCTTCGCATCTGGAAGAAAAAGCCGGGTGCG
CAGTCCTAAACAAGGGAAATGGATGCAATGCGACCAAAATTGGAGCTACTTGTTTGGCCAGTT
GGTCATCTCGTAATGACCGCGGAGGATCATCTGTTGATCGATATGCTCGGAACTAACCGAAAC
TTAGTAAGAGACAGACCCGCCGCGGATGTAAACGGGTTTACGAAGTGTGAGCTCGGACCCTGC
```

In the example below, I'm asking it generate exactly 1GiB (32,000 32KiB blocks) of sequence data with a row width of 128 characters, provide me summary benchmark information and write the data to the "mydna.txt" file:  

```
./dnaspew --block-size 32768 --block-count 32000 --width 128 --benchmark  > mydna.txt

Elapsed time: 1.6371 seconds
Total data generated: 1000.0 MiB
Rate: 610.84 MiB/s
```

## building from source

To build dnaspew from source, you need to running Nim version 0.19.0 or greater:

```
nimble install commandeer
nim c -d:release src/dnaspew.nim
```

