#!/bin/bash
# setup.sh
# Crée des symlinks depuis le repo vers le HOME

DOTFILES_DIR="$HOME/dotfiles"

symlink_create() {
    local dir="$1"
    for element in "$dir"/*; do
        local name="$(basename "$element")"

        [[ "$name" == "scripts" || "$name" == "README.md" ]] && continue

        if [ -d "$element" ]; then
            symlink_create "$element"
        else
            echo "## $(basename "$element") ##"

            local rel_path="${element#$DOTFILES_DIR/}"

            local target_dir="$HOME/$(dirname ".$rel_path")"
            local target_file="$HOME/.${rel_path}"

            mkdir -p "$target_dir"
            if [ -e "$target_file" ]; then
                cmp -s "$target_file" "$element" \
                && echo '-- Files Are Identical! No change needed --' && continue
                echo "$target_file existe déjà. Voulez vous le remplacer ? (y/N)"
                read response
                if [[ $response =~ ^[Yy]$ ]]; then
                    rm -rf "$target_file"
                    ln -s "$element" "$target_file"
                    echo "Lien symbolique recréé : $target_file --> $element"
                else
                    echo "Le fichier n'a pas été modifié"
                fi


            else
                echo "Création du lien symbolique : $target_file --> $element"
                ln -s "$element" "$target_file"
            fi
        fi
    done
}

$HOME/dotfiles/scripts/backup.sh
symlink_create "$DOTFILES_DIR"



