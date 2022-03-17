#!/usr/bin/env python
#ouput: files with binned reads for testing

import sys
#input FASTA file 
ip="data/ONT/HG002_ucsc_Jan_2019_Guppy_3.4.4.fasta"

#output files with binned reads
f1k = open("data/ONT/1k.fa","w+")
f2k = open("data/ONT/2k.fa","w+")
f3k = open("data/ONT/3k.fa","w+")
f4k = open("data/ONT/4k.fa","w+")
f5k = open("data/ONT/5k.fa","w+")
f10k = open("data/ONT/10k.fa","w+")
f20k = open("data/ONT/20k.fa","w+")
f30k = open("data/ONT/30k.fa","w+")
f40k = open("data/ONT/40k.fa","w+")
f45k = open("data/ONT/45k.fa","w+")
f50k = open("data/ONT/50k.fa","w+")
f100k = open("data/ONT/100k.fa","w+")
f150k = open("data/ONT/150k.fa","w+")
f200k = open("data/ONT/200k.fa","w+")
#f250k = open("data/ONT/250k.fa","w+")
#f300k = open("data/ONT/300k.fa","w+")
#f350k = open("data/ONT/350k.fa","w+")
#f400k = open("data/ONT/400k.fa","w+")
#f450k = open("data/ONT/450k.fa","w+")
#f500k = open("data/ONT/500k.fa","w+")
#f1M = open("data/ONT/1M.fa","w+")


#binning reads from input file
with open(ip, 'r') as f:
    for line in f:
        if line.startswith(">"):
            header = line.strip()
            seq = next(f).strip()
            if len(seq) <=1000:
                f1k.write('\n'+header + '\n' + seq)
            elif len(seq) <=2000:
                f2k.write('\n'+header + '\n' + seq)

            elif len(seq) <=3000:
                f3k.write('\n'+header + '\n' + seq)

            elif len(seq) <=4000:
                f4k.write('\n'+header + '\n' + seq)

            elif len(seq) <=5000:
                f5k.write('\n'+header + '\n' + seq)

            elif len(seq) <=10000:
                f10k.write('\n'+header + '\n' + seq)

            elif len(seq) <=20000:
                f20k.write('\n'+header + '\n' + seq)

            elif len(seq) <=30000:
                f30k.write('\n'+header + '\n' + seq)

            elif len(seq) <=40000:
                f40k.write('\n'+header + '\n' + seq)

            elif len(seq) <=45000:
                f45k.write('\n'+header + '\n' + seq)

            elif len(seq) <=50000:
                f50k.write('\n'+header + '\n' + seq)

            elif len(seq) <=100000:
                f100k.write('\n'+header + '\n' + seq)

            elif len(seq) <=150000:
                f150k.write('\n'+header + '\n' + seq)

            elif len(seq) <=200000:
                f200k.write('\n'+header + '\n' + seq)

            #elif len(seq) <=250000:
            #    f250k.write('\n'+header + '\n' + seq)

            #elif len(seq) <=300000:
            #    f300k.write('\n'+header + '\n' + seq)

            #elif len(seq) <=350000:
            #    f350k.write('\n'+header + '\n' + seq)

            #elif len(seq) <=400000:
            #    f400k.write('\n'+header + '\n' + seq)

            #elif len(seq) <=450000:
            #    f450k.write('\n'+header + '\n' + seq)

            #elif len(seq) <=500000:
            #    f500k.write('\n'+header + '\n' + seq)

            #elif len(seq) <=1000000:
            #    f1M.write('\n'+header + '\n' + seq)
f.close()
#f1M.close()
f1k.close()
f2k.close()
f3k.close()
f4k.close()
f5k.close()
f10k.close()
f20k.close()
f30k.close()
f40k.close()
f45k.close()
f50k.close()
f100k.close()
f150k.close()
f200k.close()
#f250k.close()
#f300k.close()
#f350k.close()
#f400k.close()
#f450k.close()
#f500k.close()
