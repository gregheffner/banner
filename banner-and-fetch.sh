#!/bin/bash

# --- Banner Section ---
banner_output=$(mktemp)

# Colors
RED='\033[1;31m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
GREEN='\033[1;32m'
NC='\033[0m' # No Color

{
echo -e "${RED}"
## To change your production environment name, edit the text below:
figlet "Heffner Prod"
echo -e "${NC}"

echo -e "${CYAN}Environment: Kubernetes Master Node${NC}"
echo -e "${YELLOW}--------------------------------------------------${NC}"

echo -e "${GREEN}bandwhich${NC}        - Network usage statistics"
echo -e "${GREEN}kubectl get nodes${NC} - Check cluster node status"
echo -e "${GREEN}cloudflared tunnel list${NC} - View active tunnels"
echo -e "${YELLOW}--------------------------------------------------${NC}"

echo -e "${RED}WARNING: You are accessing a PRODUCTION system.${NC}"
echo -e "${YELLOW}All actions are logged and monitored.${NC}"
echo -e "${YELLOW}Unauthorized changes are strictly prohibited.${NC}"
echo -e "${YELLOW}Double-check all commands before execution.${NC}"

echo -e "${CYAN}CI/CD Repository: https://github.com/gregheffner/cicd${NC}"
echo -e "${CYAN}For support, contact: technotuba${NC}"
echo -e "${YELLOW}--------------------------------------------------${NC}"

echo -e "\n"
} > "$banner_output"

# --- Neofetch Section ---
neofetch_output=$(mktemp)
neofetch --stdout > "$neofetch_output"

banner_lines=$(wc -l < "$banner_output")
neofetch_lines=$(wc -l < "$neofetch_output")

# Add extra lines to push neofetch further down
extra_padding=4
padding=$(( (banner_lines - neofetch_lines) / 2 + extra_padding ))
if [ $padding -lt 0 ]; then
  padding=0
fi

# Create padded neofetch output
padded_neofetch=$(mktemp)
for ((i=0; i<padding; i++)); do
  echo "" >> "$padded_neofetch"
done
cat "$neofetch_output" >> "$padded_neofetch"

# Find the widest line in the banner
banner_width=$(awk '{if (length > max) max = length} END {print max}' "$banner_output")

# Combine columns
combined_output=$(mktemp)
paste <(awk -v w="$banner_width" '{printf "%-"w"s%10s\n", $0, " "}' "$banner_output") "$padded_neofetch" > "$combined_output"

# Center each line based on terminal width
term_width=$(tput cols)
while IFS= read -r line; do
  line_length=${#line}
  if [ "$line_length" -lt "$term_width" ]; then
    padding=$(( (term_width - line_length) / 2 ))
    printf "%*s%s\n" "$padding" "" "$line"
  else
    echo "$line"
  fi
done < "$combined_output"

rm "$banner_output" "$neofetch_output" "$padded_neofetch" "$combined_output"
