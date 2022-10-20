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


#size_arr=( $(stat -c "%s" ${FPATH}*) )
#size_arr= ('stat -c "%s" ${FPATH}*')
#count_arr=$(wc $FPATH/* | awk '{ print $1 }')
#count_search
mapfile -t size_arr< <(stat -c "%s" ${FPATH}/*) #veličina fajlova dobra komanda -><-

mapfile -t count_arr< <(wc $FPATH/* | awk '{ print $1 }') #veličina fajlova dobra komanda -><-
unset count_arr[-1]


mapfile -t count_search< <(for each in "${names_arr[@]}"
do
  grep -o 'Chrome' $each | wc -l
done)



#for i in ${names_arr[@]}; do grep -o 'Chrome' i | wc -l; done

#echo ${#names_arr[@]}
#echo ${#size_arr[@]}
#echo ${#count_arr[@]}


#printf '%s\n' "${count_arr[@]}"
#printf '%s\n' "${size_arr[@]}"
#printf '%s\n' "${size_arr[2]}"

: '
echo "${count_arr[0]}"
echo "${count_arr[1]}"
echo "${count_arr[2]}"
echo "${count_arr[3]}"
echo "${count_arr[4]}"
echo "${count_arr[5]}"
echo "${count_arr[6]}"
echo "${count_arr[7]}"
echo "${count_arr[8]}"
echo "${count_arr[9]}"
echo "${count_arr[10]}"
echo "${count_arr[11]}"'
# iterate through array using a counter

#for ((i=0; i<${#count_arr[@]}; i++)); do
 #   #do something to each element of array
  #  echo "${count_arr[$i]}"
#done

#printf '%s\n' "${names_arr[0]} ${size_arr[0]} ${count_arr[0]}"
for ((i=0; i< "${#names_arr[@]}"; i++)) do printf "%s \t %s \t %s \t %s \n" "${names_arr[$i]}" "${size_arr[$i]}" "${count_arr[$i]}" "${count_search[$i]}"; done






















