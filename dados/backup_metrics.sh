#!/bin/bash
DATA_HORA=$(date +"%Y_%m_%d_%H_%M_%S")
# Salvando dentro de /data para persistir no seu PC
DIR_BACKUP="/data/stats/$DATA_HORA"
SENHA="SuperSenhaSegura123"

mkdir -p "$DIR_BACKUP"

redis-cli -a $SENHA --no-auth-warning INFO memory > "$DIR_BACKUP/memory_info.txt"
redis-cli -a $SENHA --no-auth-warning INFO stats > "$DIR_BACKUP/stats_info.txt"
redis-cli -a $SENHA --no-auth-warning INFO keyspace > "$DIR_BACKUP/keyspace_info.txt"

echo "Backup concluído em: $DIR_BACKUP"
