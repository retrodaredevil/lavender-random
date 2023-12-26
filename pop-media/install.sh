#!/usr/bin/env bash

favorite_apps=("com.plexamp.Plexamp" "tv.plex.PlexHTPC")
regular_apps=("tv.plex.PlexDesktop")

all_apps=("${favorite_apps[@]}" "${regular_apps[@]}")

flatpak install --user --assumeyes flathub "${all_apps[@]}"


for ((i=0; i<${#favorite_apps[@]}; i++)); do
    favorite_apps[$i]="${favorite_apps[$i]}.desktop"
done
favorite_apps_str=$(printf ",'%s'" "${favorite_apps[@]}")
new_favorite_apps="$(gsettings get org.gnome.shell favorite-apps | sed "s/]$/${favorite_apps_str}/")]"
echo "$new_favorite_apps"

gsettings set org.gnome.shell favorite-apps "$new_favorite_apps"
