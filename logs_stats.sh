#!/usr/bin/bash


FPATH=$1 #Prvi argument
SEARCH=$2 #Drugi argument
COUNTARG=$# #Broj unesenih argumenata


#Ovaj if ispituje da li su unesena oba argumenta
#Ako nisu ispisuje poruku i završava se sa izvršavanjem skripte
if [ $COUNTARG -eq 0 ]; then
	echo -e "\e[1;31m Error: This script needs 2 args: \n PATH && SEARCH \e[0m"
	exit 1
	
fi


#Ovaj if ispituje da li je unesen samo jedan argument
#Ako jeste, ispisuje se poruka i završava se sa izvršavanjem skripte
if [ $COUNTARG -eq 1 ]; then
	echo -e "\e[1;31m Error: You entered only one argument,and you need to enter one more! \e[0m"
	echo -e "\e[1;31m Error: This script needs 2 args: \n PATH && SEARCH \e[0m"
	exit 1
	
fi
	
#Ovdje se ispituje da li postoji direktorij koji je korisnik unio kao prvi argument
if [ ! -d $FPATH ]; then
	echo -e "\e[1;31m First entered argument [PATH] is invalid, because it doesn't exist... \e[0m"
	exit 1
	
	else
	echo -e "\e[1;20m Loading.... \e[0m"
fi 

#Pozicioniranje na mjesto putanje
cd $FPATH


# U sljedećim varijablama se nalaze informacije o fajlovima 
#names_arr - imena fajlova
#size_arr - veličina fajlova
#count_arr - broj redova fajla
#countSearch_arr - koliko puta se 2 argument nalazi u fajlu

#names_arr=(/home/nedim/Desktop/tmp/logs/*)
names_arr=($FPATH/*) 

mapfile -t size_arr< <(stat -c "%s" ${FPATH}/*) #veličina fajlova dobra komanda -><-

mapfile -t count_arr< <(wc $FPATH/* | awk '{ print $1 }') #veličina fajlova dobra komanda -><-
unset count_arr[-1]


mapfile -t count_search< <(for each in "${names_arr[@]}"
do
  grep -o $2 $each | wc -l
done)





#echo ${#names_arr[@]}
#echo ${#size_arr[@]}
#echo ${#count_arr[@]}


#printf '%s\n' "${count_arr[@]}"
#printf '%s\n' "${size_arr[@]}"
#printf '%s\n' "${size_arr[2]}"



#names_arr=("File name" ${names_arr[@]})
#count_arr=("Total lines" ${count_arr[@]})
#count_search=("Search wor counter" ${count_search[@]})

printf "%s \t \t  \t  \t  \t  %s \t %s \t %s \n" "File name" "File size" "Total lines" "Search counter" 
for ((i=0; i< "${#names_arr[@]}"; i++)) do printf "%s \t %s \t \t %s \t %s \n" "${names_arr[$i]}" "$((${size_arr[$i]}/1000000))"MB"" "${count_arr[$i]}" "${count_search[$i]}"; done






















