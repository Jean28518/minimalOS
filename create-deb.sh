#!/bin/bash

# Build Linux Assistant
chmod +x deb/usr/lib/minimal-os/install-minimal-os.sh
chmod 755 deb/DEBIAN
chmod 775 deb/DEBIAN/postinst

# Build deb package
dpkg-deb --build -Zxz --root-owner-group deb 
mv deb.deb minimal-os.deb