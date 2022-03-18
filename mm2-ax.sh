#!/bin/bash

#generate output from mm2-ax
mkdir out;
if [[ $1 -eq 2000 ]]
then	
	echo "bin length set to $1";
	head -n $((211*972*2)) data/ONT/2k.fa > data/ip.fa; bin/b2k -t 1 -x map-ont data/hg38.mmi data/ip.fa > out/2k.log;
elif [[ $1 -eq 3000 ]]
then	
	echo "bin length set to $1"
	head -n $((102*972*2)) data/ONT/3k.fa > data/ip.fa; bin/b3k -t 1 -x map-ont data/hg38.mmi data/ip.fa > out/3k.log;

elif [[ $1 -eq 4000 ]]
then	
	echo "bin length set to $1"
	head -n $((85*972*2)) data/ONT/4k.fa > data/ip.fa; bin/b4k -t 1 -x map-ont data/hg38.mmi data/ip.fa > out/4k.log;

elif [[ $1 -eq 5000 ]]
then	
	echo "bin length set to $1"
	head -n $((64*972*2)) data/ONT/5k.fa > data/ip.fa; bin/b5k -t 1 -x map-ont data/hg38.mmi data/ip.fa > out/5k.log;

elif [[ $1 -eq 10000 ]]
then	
	echo "bin length set to $1"
	head -n $((39*972*2)) data/ONT/10k.fa > data/ip.fa; bin/b10k -t 1 -x map-ont data/hg38.mmi data/ip.fa > out/10k.log;

elif [[ $1 -eq 20000 ]]
then	
	echo "bin length set to $1"
	head -n $((18*972*2)) data/ONT/20k.fa > data/ip.fa; bin/b20k -t 1 -x map-ont data/hg38.mmi data/ip.fa > out/20k.log;

elif [[ $1 -eq 30000 ]]
then	
	echo "bin length set to $1"
	head -n 18 data/ONT/30k.fa > data/ip.fa; 
	head -n $((23015*9*2)) data/ONT/2k.fa >> data/ip.fa; bin/b30k -t 1 -x map-ont data/hg38.mmi data/ip.fa > out/30k.log;

elif [[ $1 -eq 40000 ]]
then	
	echo "bin length set to $1"
	head -n 18 data/ONT/40k.fa > data/ip.fa; 
	head -n $((23001*9*2)) data/ONT/2k.fa >> data/ip.fa; bin/b40k -t 1 -x map-ont data/hg38.mmi data/ip.fa > out/40k.log;

elif [[ $1 -eq 45000 ]]
then	
	echo "bin length set to $1"
	head -n 18 data/ONT/50k.fa > data/ip.fa; 
	head -n $((22999*9*2)) data/ONT/2k.fa >> data/ip.fa; bin/b45k -t 1 -x map-ont data/hg38.mmi data/ip.fa > out/45k.log;
	
elif [[ $1 -eq 50000 ]]
then
	echo "bin length set to $1"
	head -n 18 data/ONT/50k.fa > data/ip.fa; 
	head -n $((22993*9*2)) data/ONT/2k.fa >> data/ip.fa; bin/b50k -t 1 -x map-ont data/hg38.mmi data/ip.fa > out/50k.log;

elif [[ $1 -eq 100000 ]]
then	
	echo "bin length set to $1"
	head -n 18 data/ONT/100k.fa > data/ip.fa; 
	head -n $((22968*9*2)) data/ONT/2k.fa >> data/ip.fa; bin/b100k -t 1 -x map-ont data/hg38.mmi data/ip.fa > out/100k.log;
	
elif [[ $1 -eq 150000 ]]
then	
	echo "bin length set to $1"
	head -n 18 data/ONT/150k.fa > data/ip.fa; 
	head -n $((22922*9*2)) data/ONT/2k.fa >> data/ip.fa; bin/b150k -t 1 -x map-ont data/hg38.mmi data/ip.fa > out/150k.log;
fi

#generate output from mm2-fast to check output equality
bin/mm2-fast -t 1 -x map-ont data/hg38.mmi data/ip.fa > out/2k-mm2-fast.log;
