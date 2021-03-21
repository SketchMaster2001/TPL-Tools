#!bin/bash

encode=*.png
decode=*.tpl

decode() {
    for i in ${decode}
    do
        wimgt dec ${decode}
    done
} > /dev/null 2>&1

encode() {
    for i in ${encode}
    do
        wimgt enc ${encode}
    done
} > /dev/null 2>&1

header() {
        clear
        printf "\033[1mTPL Tools Created by SketchMaster2001\033[0m\n" | fold -s -w "$(tput cols)"
        printf -- "=%.0s" $(seq "$(tput cols)") && printf "\n\n"
}

main() {
    clear
    header
    printf "TPL Tools\n\n1. Decode\n2. Encode\n\n"
    read -p "Choose: " s 

    case ${s} in
        1) clear; header; printf "Decoding TPL..."; decode ;;
        2) clear; header; printf "Encoding PNG..."; encode ;;
        *) printf "Invalid Selection\n"; sleep 2; main ;;
    esac
}

main

clear
header
printf "Operation Complete\n\n"
