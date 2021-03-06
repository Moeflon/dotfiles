#! /bin/bash

LIGHT="#839496FF"
DARK="#FFBBBBBB"

clock() {
    DATE=$(date "+%a %b %d, %T")
    echo -n "$DATE"
}


workspace() {
    SPACES=$(bspc query -D);
    SPACE=$(bspc query -D -d);
    
    buffer="  ";

    while read -r sp; do
        if [ ${sp} == ${SPACE} ] 
        then
            buffer+="%{F$LIGHT}${sp}%{F-}";
        else
            buffer+="%{F$DARK}${sp}%{F-}";
        fi
        buffer+="  ";
    done <<< "$SPACES"
    echo "$buffer  ";
}

cpu() {
   ps -eo pcpu | awk 'BEGIN {sum=0.0f} {sum+=$1} END {print sum}'
}

ram() {
    # store the total and free memory in two variables
    read t f <<< `grep -E 'Mem(Total|Free)' /proc/meminfo |awk '{print $2}'`
    read b c <<< `grep -E '^(Buffers|Cached)' /proc/meminfo |awk '{print $2}'`

    # then, calcultate the percentage of memory used
    bc <<< "100 * ($t -$f -$c -$b) / $t"
}

while true; do
    echo "%{l}%{F$DARK}$(clock)%{c}$(workspace)%{r}%{F$LIGHT}CPU %{F$DARK}$(cpu)%  %{F$LIGHT}RAM %{F$DARK}$(ram)"
    sleep 1;
done
