#!/usr/bin/env python3

import subprocess

favorite_apps = ["com.plexamp.Plexamp", "tv.plex.PlexHTPC"]
regular_apps = ["tv.plex.PlexDesktop"]

# Append ".desktop" to each favorite app

all_apps = favorite_apps + regular_apps

# Install Flatpak applications
subprocess.run(["flatpak", "install", "--user", "--assumeyes", "flathub"] + all_apps)

favorite_apps = [app + ".desktop" for app in favorite_apps]

# Join the favorite apps into a string for gsettings
favorite_apps_str = f'["{'", "'.join(favorite_apps)}"]'

# Set favorite apps using gsettings
subprocess.run(["gsettings", "set", "org.gnome.shell", "favorite-apps", "$(gsettings get org.gnome.shell favorite-apps | sed 's/]$/" + favorite_apps_str + "/')"])
