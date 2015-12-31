# Birus

## Matériel

[Asus Zenbook UX305FA-FB003P](http://www.ldlc.com/fiche/PB00181362.html)

### Configuration

```
Processeur      : Intel® Core™ M-5Y10 (0,8 GHz Mode Turbo 2 GHz)
Mémoire         : 8192 Mo DDR3L 1600 MHz
Écran           : 13,3" WQXGA+ (3200 x 1800)
Dalle           : IPS Mat / Anti-reflets
Graphisme       : Intel® HD Graphics
Stockage        : SSD 256 Go
Refroidissement : sans ventilateur
Wi-Fi           : 802.11ac
Bluetooth       : 4.0
USB             : 3 x 3.0
HDMI            : 1 x micro
Batterie        : 3 cellules Li-polymer
Autonomie       : 9,5 heures
Dimensions      : 324 x 226 x 12,3 mm
Poids           : 1,2 kg
OS (OEM)        : Windows 8.1 Professionnel 64 bits
Garantie        : 2 ans
```

## Installation

L'installation se déroule en 3 étapes :

* préparer une clé USB depuis un système linux ;
* installer le système minimal
* démarrer sur la nouvelle installation d'ArchLinux et finaliser l'installation.

### Créer une clé USB ArchLinux Live

Utiliser le script `liveusb.sh`. Ce script défini 4 variables :

* `archiso` : chemin vers l'image ISO locale
* `archurl` : adresse URL de l'image ISO ArchLinux
* `archsum` : chemin vers le hash MD5 de l'image ISO
* `archusb` : nom assigné à la clé USB

```bash
cd scripts
sudo ./liveusb.sh

# stdout
INFO    ArchLinux ISO downloading...
arch.iso            100%[=====================>] 663.00M  1012KB/s   in 19m 51ss

2015-12-30 01:15:50 (570 KB/s) - arch.iso saved [695205888/695205888]

INFO    Check sum...
INFO    OK
INFO    Burn ISO...
Select usb device:
1) sda
2) sdb
#? 2
Burn ISO into /dev/sdb? ([y]es or [N]o): y
INFO    ISO will be burned into /dev/sdb
mkfs.fat 3.0.27 (2014-11-12)
mkfs.fat: /dev/sdb1 contains a mounted filesystem.
mount: /dev/loop0 is write-protected, mounting read-only
INFO    ISO was burned successfully into /dev/sdb
```

__Notes :__

* les privilèges __root__ sont nécessaires pour monter la clé
  usb (et l'iso) ;
* un dossier `scripts` est créé à la racine de la clé (il contient le
  script d'installation `install.sh`).

__Attention !__

Le nom pour la clé USB n'est pas choisi au hasard! Il est
choisi pour éviter une erreur _"30 seconds" error due to the
/dev/disk/by-label/ARCH_XXXXYY not mounting"_.

Néanmoins, si un autre nom est donné à la clé USB, il est possible de
"fixer" cette erreur avec un lien symbolique.
Par exemple, si la clé USB est `/dev/sdb` et que le périphérique attendu
est `ARCH_XXXXYY`, il faut créer le lien suivant :
`ln -sf /dev/sdb /dev/disk/by-label/ARCH_XXXXYY` et appuyer sur `CTRL+D`
([source](https://andym3.wordpress.com/2010/12/16/fix-usb-boot-error-in-arch-linux/)).

### Installer le système de base

Il faut booter sur la clé USB et exécuter le script `install.sh` :

* Au démarrage de l'ordinateur, appuyer sur la touch `ESC` ("échap")
à l'affichage de l'écran "[Asus, in search of incredible](http://www.quikrpost.com/wp-content/uploads/2015/02/Asus-In-search-of-Incredible.png)"
et sélectionner la clé USB dans le menu déroulant.
* Sélectionner la première option du menu : `Arch Linux archiso x96_64 UEFI USB`.
* Une installation en RAM d'ArchLinux doit alors démarrer. Si l'erreur
_"30 seconds" error due to the /dev/disk/by-label/ARCH_XXXXYY not mounting"_
apparait, il faut vérifier le nom de la clé USB.
* Lancer le script `install.sh` du dossier `scripts` à la racine de la clé normalement montée dans `/run/archiso/bootmnt`.

```bash
cd /run/archiso/bootmnt/scripts
./install.sh
```

Le script installe un système minimal et copie le dossier `scripts` dans
le répertoire `/root`. Au premier démarrage, il faudra exécuter le script
`/root/scripts/postinstall.sh` pour terminer l'installation.

### Terminer l'installation

Au premier démarrage d'ArchLinux, il faut exécuter le
script `/root/scripts/postinstall.sh`.

Il est nécessaire de posséder une connexion internet pour finaliser
l'installation.
