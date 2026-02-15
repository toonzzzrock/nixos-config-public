#!/usr/bin/env bash
set -euo pipefail

start=$(date -d '2004-10-19' +%s)
end=$(date -d '2084-10-19' +%s)
now=$(date +%s)

total=$((end - start))
elapsed=$((now - start))
(( elapsed < 0 )) && elapsed=0
(( elapsed > total )) && elapsed=$total

left=$(( total - elapsed ))
days=$(( left / 86400 ))
hours=$(( (left % 86400) / 3600 ))
mins=$(( (left % 3600) / 60 ))
secs=$(( left % 60 ))

barlen=18
filled=$(( total == 0 ? 0 : elapsed * barlen / total ))
(( filled < 0 )) && filled=0
(( filled > barlen )) && filled=$((barlen))
empty=$(( barlen - filled ))

# Build bars without `tr` (works regardless of locale)
printf -v filled_bar '%*s' "$filled" ''
filled_bar=${filled_bar// /█}
printf -v empty_bar '%*s' "$empty" ''
empty_bar=${empty_bar// /░}

percent=$(awk -v e="$elapsed" -v t="$total" 'BEGIN{ if(t==0)print "0.00"; else printf "%.0f",(e/t)*100 }')

magenta="\033[35m"
reset="\033[0m"

echo -e "${magenta}$filled_bar${reset}$empty_bar (${magenta}${percent}%${reset}) ${days}d ${hours}h ${mins}m ${secs}s "