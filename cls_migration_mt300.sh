#!/bin/bash

# Paramètres
input=`pwd`                        # Path des fichiers input (pwd = répertoire courant)
output="/home/gobertj1a/tmp"       # Path pour les fichiers/répertoires output
output_prefix="all_"               # Préfixe des fichiers de résultat (concaténés)
pattern=SW*txt                     # Pattern pour sélectionner tous les fichiers input

# Variables fixes
file_count=$(cd $input | ls -lrth $pattern | wc -l)        # Nombre de fichiers à traiter (correspondant au pattern)
counter=0                                                  # Nombre de fichiers traités
current_time=$(date "+%Y%m%d_%H%M%S")                      # Timestamp

# Codes couleur
nc='\033[0m'
green='\033[0;32m'
red='\033[0;31m'
yellow='\033[0;33m'
cyan='\033[0;36m'

# Lancement du script
echo
echo -e "${green}***************************************************************"
echo -e "*** Projet CLS - Exécution du script de migration des MT300 ***"
echo -e "***************************************************************${nc}"

# Purge des répertoires et fichiers existants
echo
if [ -d cls ]; then # Si le répertoire cls existe
  echo -e "${yellow}Purge des répertoires et fichiers existants${nc}"
  echo -e "  rm -R ${output}/cls/"
  rm -R ${output}/cls/
fi

# Création des répertoires de destination
echo
echo -e "${yellow}Création des répertoires de destination"
echo -e "  ${nc}${output}/cls/canc/"
echo -e "  ${nc}${output}/cls/newt/"
mkdir -p ${output}/cls/canc
mkdir -p ${output}/cls/newt

# Display du nombre de fichiers à traiter
echo
echo -e "${yellow}$file_count fichiers à traiter dans $output${nc}" 

# Pour chaque fichier matché par le pattern
for f in $pattern
do
  counter=$((counter+1))              # Compteur
  file_name=$(basename "$f")          # Récupération du nom du fichier sans le path
  extension="${file_name##*.}"        # Récupération de l'extension du fichier
  file_name="${file_name%.*}"         # Récupération du nom du fichier sans l'extension

  echo -e "  ${cyan}$counter) Traitement de $file_name..${nc}"
  # Création du message d'annulation
  sed -e 's/:22A:NEWT/:22A:CANC/' $f > cls/canc/"${file_name}.canc.${current_time}"
  # Création du message de reconfirmation
  sed -e '0,/:57A:/s//:TODELETE:/' -e '/:TODELETE:/d' -e 's/:56A:/:57A:/' -e 's/\(:20:[a-zA-Z0-9]\{8\}\)/\1B/' $f > cls/newt/"${file_name}.newt.${current_time}"
done

# Concaténation des fichiers dans le répertoire /cls
for files in ${output}/cls/canc/*
do
  cat "$files"
  echo
done > ${output}/cls/all_canc.${current_time}

for files in ${output}/cls/newt/*
do
  cat "$files"
  echo
done > ${output}/cls/all_newt.${current_time}

echo
echo -e "${yellow}Concaténation des fichiers${nc}"
ls -lrth ${output}/cls/${output_prefix}*

# Rapport d'exécution + contrôle si nbr de fichiers à traiter égal au nbr de fichiers traités
echo
if [ $counter -eq ${file_count} ]; then
  echo -e "${green}Fin d'exécution OK - Fichiers traités ${counter}/${file_count}${nc}"
else
  echo -e "${red}!!! Fin d'exécution NOK - Fichiers traités ${counter}/${file_count} !!!${nc}"
fi
echo
