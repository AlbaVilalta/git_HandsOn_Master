#!/bin/bash
seq=$1
seq=$(echo $seq | tr a-z A-Z)  # Note we just added this line
if [[ $seq =~ ^[ACGTU]+$ ]]; then # if in seq there is some of these letters
  if [[ $seq =~ T ]]; then # if there is a T in seq
    echo "The sequence is DNA" # print that seq is a DNA sequence
  elif [[ $seq =~ U ]]; then # if there is a U in seq
    echo "The sequence is RNA" # print that seq is an RNA sequence
  else # if there is not a U or a T
    echo "The sequence can be DNA or RNA" # print that seq is not a DNA or an RNA
  fi
else # if there is any letter that is not ACGTU
  echo "The sequence is not DNA nor RNA" # print that seq is nor DNA or RNA
fi

motif=$(echo $2 | tr a-z A-Z)
if [[ -n $motif ]]; then
  echo -en "Motif search enabled: looking for motif '$motif' in sequence '$seq'... "
  if [[ $seq =~ $motif ]]; then
    echo "FOUND THE MOTIF"
  else
    echo "NOT FOUND THE MOTIF"
  fi
fi
