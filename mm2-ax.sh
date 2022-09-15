#!/bin/bash

#script rgoups the reads & invokes mm2-ax binary
#input: $1 is read length; $2 is path to data folder. 
#For example: bin/mm2-ax.sh 2000 ../data

echo "bin length set to $1" ;
if [[ $1 -eq 2000 ]]
then	
	
	head -n $((211*972*2)) $2/ONT/2k.fa > $2/ip.fa; 
	bin/mm2-ax -t 1 -x map-ont ../data/hg38.mmi ../data/ip.fa --total-no-of-reads=205092 --blocks-per-stream=972 > mm2-ax-$1.log ;
	
elif [[ $1 -eq 3000 ]]
then	
	
	head -n $((100*972*2)) $2/ONT/3k.fa > $2/ip.fa; 
	bin/mm2-ax -t 1 -x map-ont ../data/hg38.mmi ../data/ip.fa --total-no-of-reads=97200 --blocks-per-stream=972 >   mm2-ax-$1.log ;
	

elif [[ $1 -eq 4000 ]]
then	
	
	head -n $((85*972*2)) $2/ONT/4k.fa > $2/ip.fa; 
	bin/mm2-ax -t 1 -x map-ont ../data/hg38.mmi ../data/ip.fa --total-no-of-reads=82620 --blocks-per-stream=972 > mm2-ax-$1.log ;
	

elif [[ $1 -eq 5000 ]]
then	
	
	head -n $((64*972*2)) $2/ONT/5k.fa > $2/ip.fa; 
	bin/mm2-ax -t 1 -x map-ont ../data/hg38.mmi ../data/ip.fa --total-no-of-reads=62208 --blocks-per-stream=972 > mm2-ax-$1.log ;
	

elif [[ $1 -eq 10000 ]]
then	
	
	head -n $((39*972*2)) $2/ONT/10k.fa > $2/ip.fa; 
	bin/mm2-ax -t 1 -x map-ont ../data/hg38.mmi ../data/ip.fa --total-no-of-reads=37908 --blocks-per-stream=972 > mm2-ax-$1.log ;
	
elif [[ $1 -eq 20000 ]]
then	
	
	
	head -n 18 $2/ONT/20k.fa > $2/ip.fa; 
	head -n $((22917*9*2)) $2/ONT/2k.fa >> $2/ip.fa; 
	bin/mm2-ax -t 1 -x map-ont ../data/hg38.mmi ../data/ip.fa --total-no-of-reads=206271 --blocks-per-stream=9 > mm2-ax-$1.log ;

elif [[ $1 -eq 30000 ]]
then	
	
	
	
	head -n 18 $2/ONT/30k.fa > $2/ip.fa; 
	head -n $((22913*9*2)) $2/ONT/2k.fa >> $2/ip.fa; 
	bin/mm2-ax -t 1 -x map-ont ../data/hg38.mmi ../data/ip.fa --total-no-of-reads=206235 --blocks-per-stream=9 > mm2-ax-$1.log ;

elif [[ $1 -eq 40000 ]]
then	
	
	
	
	head -n 18 $2/ONT/40k.fa > $2/ip.fa; 
	head -n $((22903*9*2)) $2/ONT/2k.fa >> $2/ip.fa; 
	bin/mm2-ax -t 1 -x map-ont ../data/hg38.mmi ../data/ip.fa --total-no-of-reads=206145 --blocks-per-stream=9 > mm2-ax-$1.log ;

elif [[ $1 -eq 45000 ]]
then	
	
	
	head -n 18 $2/ONT/45k.fa > $2/ip.fa; 
	head -n $((22901*9*2)) $2/ONT/2k.fa >> $2/ip.fa; 
	bin/mm2-ax -t 1 -x map-ont ../data/hg38.mmi ../data/ip.fa --total-no-of-reads=206127 --blocks-per-stream=9 > mm2-ax-$1.log ;
	
elif [[ $1 -eq 50000 ]]
then
	
	
	head -n 18 $2/ONT/50k.fa > $2/ip.fa; 
	head -n $((22894*9*2)) $2/ONT/2k.fa >> $2/ip.fa; 
	bin/mm2-ax -t 1 -x map-ont ../data/hg38.mmi ../data/ip.fa --total-no-of-reads=206064 --blocks-per-stream=9 > mm2-ax-$1.log ;
elif [[ $1 -eq 100000 ]]
then	
	
	
	head -n 18 $2/ONT/100k.fa > $2/ip.fa; 
	head -n $((22874*9*2)) $2/ONT/2k.fa >> $2/ip.fa; 
	bin/mm2-ax -t 1 -x map-ont ../data/hg38.mmi ../data/ip.fa --total-no-of-reads=205884 --blocks-per-stream=9 > mm2-ax-$1.log ;
	
elif [[ $1 -eq 150000 ]]
then	
	
	head -n 18 $2/ONT/150k.fa > $2/ip.fa; 
	head -n $((22818*9*2)) $2/ONT/2k.fa >> $2/ONT/ONT/ip.fa; 
	bin/mm2-ax -t 1 -x map-ont ../data/hg38.mmi ../data/ip.fa --total-no-of-reads=205380 --blocks-per-stream=9 > mm2-ax-$1.log ;
fi

#generate output from minimap2 v2.17 binary (MAX_SKIP=INF) to visually inspect output equality
bin/minimap2 -t 1 -x map-ont $2/hg38.mmi $2/ip.fa > mm2-$1.log;
