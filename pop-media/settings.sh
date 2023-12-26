#!/usr/bin/env bash


# Dim the screen when idle - idle time is not configurable
gsettings set org.gnome.settings-daemon.plugins.power idle-dim true
gsettings set org.gnome.settings-daemon.plugins.power idle-brightness 30

# screen blank after 12 minutes
gsettings set org.gnome.desktop.session idle-delay 720

# Turn on automatic suspend on battery power
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'suspend'
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-timeout 1800  # 1800 seconds = 30 minutes

# Turn off automatic suspend on AC power
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'

# Automatic locking will not occur
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.screensaver ubuntu-lock-on-suspend true
gsettings set org.gnome.desktop.screensaver logout-enabled false  # confirm that auto logout is not enabled
