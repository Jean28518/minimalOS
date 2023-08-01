#!/bin/bash

export DEBIAN_FRONTEND="noninteractive"

update_config() {
    local file=$1
    local key=$2
    local value=$3

    # Überprüfen, ob die Datei existiert und lesbar ist
    if [ ! -f "$file" ] || [ ! -r "$file" ]; then
        echo "Fehler: Die Datei $file existiert nicht oder ist nicht lesbar."
        exit 1
    fi

    # Suchen des Schlüssels in der Datei und Ersetzen des Werts
    if grep -q "^$key=" "$file"; then
        # Der Schlüssel existiert bereits, daher aktualisieren wir seinen Wert
        sed -i "s/^$key=.*/$key=$value/" "$file"
    else
        # Der Schlüssel existiert nicht, daher fügen wir ihn hinzu
        echo "$key=$value" >> "$file"
    fi
}

sed -i "s/^#autologin-user=.*/autologin-user=user/" "/etc/lightdm/lightdm.conf"
sed -i "s/^#autologin-user-timeout=.*/autologin-user-timeout=0/" "/etc/lightdm/lightdm.conf"

update_config "/etc/default/grub" "GRUB_TIMEOUT" "0"
update_config "/etc/default/grub" "GRUB_HIDDEN_TIMEOUT" "1"
update-grub





cp /usr/lib/minimal-os/openbox/autostart /etc/xdg/openbox/autostart
cp /usr/lib/minimal-os/openbox/menu.xml /etc/xdg/openbox/menu.xml

python3 /usr/lib/minimal-os/openbox/setup-media-keys.py


echo unattended-upgrades unattended-upgrades/enable_auto_updates boolean true | debconf-set-selections
/usr/sbin/dpkg-reconfigure -f noninteractive unattended-upgrades
