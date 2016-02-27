#!/bin/bash

#Descomprime un archivo *.fastq.gz y rea su corrrspondientes archivo fasta y qual

#dir= /home/tania/Escritorio 
file=toy_R2.fastq.gz 
file2=toy_R2.fastq

if [ -f $file ]; then
	echo "Descomprimiendo archivo $file"
	gzip -d -k $file
else
	echo "Archivo $file no encontrado en el directorio actual ...buscando en tu home"
	dir=`find ~/ -name $file -exec dirname {} \;`
	if [ -z $dir ]; then
		echo "Archivo no encontrado en tu home"
		exit
	else
		mv $dir/$file ~/bioinformatic/
		gzip -d -k $dir/$file
	fi

fi


sed -n '1~4p;2~4p' $file2 | sed 's/^@/>/g' > toy_R2.fasta
sed -n '1~4p;4~4p' $file2 | sed 's/^@/>/g' > toy_R2.qual

