#!/bin/bash
# Script: searchsploit_auditor.sh
# Descripción: Busca exploits para servicios populares usando SearchSploit.
# Autor: JDEXPLOIT
# Uso: ./searchsploit_auditor.sh <servicio1> <servicio2> ...

# Colores para la salida
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}[*] Iniciando búsqueda de exploits con SearchSploit...${NC}\n"

# Array de servicios a buscar (se pueden pasar como argumentos)
if [ $# -eq 0 ]; then
    servicios=("Apache" "OpenSSH" "Vsftpd" "ProFTPd" "Samba" "MySQL")
else
    servicios=("$@")
fi

for servicio in "${servicios[@]}"; do
    echo -e "${RED}========================================${NC}"
    echo -e "${GREEN}[+] Buscando exploits para: $servicio${NC}"
    echo -e "${RED}========================================${NC}"
    searchsploit "$servicio" --exclude="/dos/" | head -20  # Excluye DoS y muestra primeros 20 resultados
    echo ""
done

echo -e "${GREEN}[*] Búsqueda finalizada.${NC}"
echo "Nota: Revise los resultados en detalle y valide la compatibilidad del exploit con su entorno."
