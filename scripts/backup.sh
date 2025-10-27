#!/bin/bash
# backup.sh
# Sauvegarde automatiquement les fichiers de configuration liés à ton répertoire ~/dotfiles
# dans ~/dotfiles_backup/<timestamp>

DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/dotfiles_backup"
timestamp=$(date +"%Y-%m-%d_%H:%M:%S")
DEST_DIR="$BACKUP_DIR/$timestamp"

mkdir -p "$DEST_DIR"

echo "## Backup created at ${timestamp} ##"
echo "Dossier de destination : $DEST_DIR"
echo

find "$DOTFILES_DIR" -type f ! -path "*/scripts/*" ! -name "README.md" | while read -r file; do
    rel_path="${file#$DOTFILES_DIR/}"

    source_file="$HOME/.${rel_path}"

    dest_file="$DEST_DIR/${rel_path}"

    if [ -e "$source_file" ]; then
        mkdir -p "$(dirname "$dest_file")"
        cp -r "$source_file" "$dest_file"
        echo "Sauvegardé : $source_file → $dest_file"
    else
        echo "Fichier introuvable : $source_file"
    fi
done

echo
echo "Sauvegarde terminée dans : $DEST_DIR"



