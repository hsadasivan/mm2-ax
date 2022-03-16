#!/bin/bash

#generate output from mm2-ax
mkdir out;
if ($(bin),2000)
	echo "bin length set to $(bin)"
	head -n ((211*972*2)) data/ONT/batch_2k.fa > data/ip.fa; bin/b2k -t 1 -x map-ont data/hg38.mmi data/ip.fa > out/2k.log;

elif ($(bin),3000)
	echo "bin length set to $(bin)"
	head -n ((102*972*2)) data/ONT/batch_3k.fa > data/ip.fa; bin/b3k -t 1 -x map-ont data/hg38.mmi data/ip.fa > out/3k.log;

elif ($(bin),4000)
	echo "bin length set to $(bin)"
	head -n ((85*972*2)) data/ONT/batch_4k.fa > data/ip.fa; bin/b4k -t 1 -x map-ont data/hg38.mmi data/ip.fa > out/4k.log;

elif ($(bin),5000)
	echo "bin length set to $(bin)"
	head -n ((64*972*2)) data/ONT/batch_5k.fa > data/ip.fa; bin/b5k -t 1 -x map-ont data/hg38.mmi data/ip.fa > out/5k.log;

elif ($(bin),10000)
	echo "bin length set to $(bin)"
	head -n ((39*972*2)) data/ONT/batch_10k.fa > data/ip.fa; bin/b10k -t 1 -x map-ont data/hg38.mmi data/ip.fa > out/10k.log;

elif ($(bin),20000)
	echo "bin length set to $(bin)"
	head -n ((18*972*2)) data/ONT/batch_20k.fa > data/ip.fa; bin/b20k -t 1 -x map-ont data/hg38.mmi data/ip.fa > out/20k.log;

elif ($(bin),30000)
	echo "bin length set to $(bin)"
	head -n ((1*9*2)) data/ONT/batch_30k.fa > data/ip.fa; 
	head -n ((23017*9*2)) data/ONT/batch_2k.fa >> data/ip.fa; bin/b30k -t 1 -x map-ont data/hg38.mmi data/ip.fa > out/30k.log;

elif ($(bin),40000)
	echo "bin length set to $(bin)"
	head -n ((1*9*2)) data/ONT/batch_40k.fa > data/ip.fa; 
	head -n ((23003*9*2)) data/ONT/batch_2k.fa >> data/ip.fa; bin/b40k -t 1 -x map-ont data/hg38.mmi data/ip.fa > out/40k.log;

elif ($(bin),45000)
	echo "bin length set to $(bin)"
	head -n ((1*9*2)) data/ONT/batch_50k.fa > data/ip.fa; 
	head -n ((23001*9*2)) data/ONT/batch_2k.fa >> data/ip.fa; bin/b45k -t 1 -x map-ont data/hg38.mmi data/ip.fa > out/45k.log;
	
elif ($(bin),50000)
	echo "bin length set to $(bin)"
	head -n ((1*9*2)) data/ONT/batch_50k.fa > data/ip.fa; 
	head -n ((22996*9*2)) data/ONT/batch_2k.fa >> data/ip.fa; bin/b50k -t 1 -x map-ont data/hg38.mmi data/ip.fa > out/50k.log;

elif ($(bin),100000)
	echo "bin length set to $(bin)"
	head -n ((1*9*2)) data/ONT/batch_100k.fa > data/ip.fa; 
	head -n ((22970*9*2)) data/ONT/batch_2k.fa >> data/ip.fa; bin/b100k -t 1 -x map-ont data/hg38.mmi data/ip.fa > out/100k.log;
	
elif ($(bin),150000)
	echo "bin length set to $(bin)"
	head -n ((1*9*2)) data/ONT/batch_150k.fa > data/ip.fa; 
	head -n ((22924*9*2)) data/ONT/batch_2k.fa >> data/ip.fa; bin/b150k -t 1 -x map-ont data/hg38.mmi data/ip.fa > out/150k.log;
fi

#generate output from mm2-fast to check output equality
bin/mm2-fast -t 1 -x map-ont data/hg38.mmi data/ip.fa > out/2k-mm2-fast.log;
