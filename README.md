# minimalOS

Einfaches Linux für Kiosks oder sehr leichte Workstations, welches nahezu nur aus einem Chromium Browser besteht aber sich vollautomatisch aktualisiert und (fast) ausbruchsicher ist.

Gesteuert kann das System über einen Klick auf den Desktop, nachdem der Browser geschlossen wurde (Alt+F4).

Der Standard-Benutzer hat keine Root-Rechte und meldet sich vollautomatisch ohne Passworteingabe ein.
Um Root zu werden, muss man auf eine andere Konsole wechseln (Beispiel: Strg + Alt + F1) und sich dann als `root` einloggen. Das Passwort dafür kann in der `preseed.cfg` und ist standardmäßig `mei3eiN6`.

**Achtung:** !Das System installiert sich vollautomatisch auf den Rechner und löscht alle Partitionen!

## .iso-Datei bauen

- Unter `deb/usr/lib/minimal-os/openbox` kann das OpenBox Menü und die Autostart-Datei angepasst werden. Dort kann ebenfalls der Link der Webseite, die sich standardmäßig öffnen soll definiert werden.
- Ebenfalls kann das Hintergrundbild `deb/usr/share/backgrounds/minimal-os.jpg` ausgetauscht werden
- Außerdem kann das OpenBox Menü (Rechtsklick) unter `deb/usr/lib/minimal-os/menu.xml` angepasst werden. Standardmäßig ist das volle Menü deaktiviert.
- In der `preseed.cfg` Datei können Standard-Passwörter angepasst werden, sowie die vollautomatische Installation unterbrochen werden.

```bash
bash download-debian.sh
bash create-deb.sh
bash build.sh
```

- Nun sollte eine minimalOS.iso Datei existieren, die wie jedes andere Linux vollautomatisch installiert werden kann. **Achtung: Das System formatiert unter Umständen alle Festplatten auf dem System!**
