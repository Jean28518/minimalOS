# Download the index.html of debian.org
wget -O /tmp/debian-index.html https://cdimage.debian.org/debian-cd/current/arm64/iso-cd/

#search for the line with https://*-amd64-netinst.iso and extract the link to the latest debian iso
DOWNLOAD_LINK=$(grep -oP 'href="\K[^"]*debian-[0-9]+.[0-9]+.[0-9]+-arm64-netinst.iso' /tmp/debian-index.html)

echo "Downloading the latest debian iso from: $DOWNLOAD_LINK"

wget -O debian-original.iso https://cdimage.debian.org/debian-cd/current/arm64/iso-cd/$DOWNLOAD_LINK