# Systemadministratio
## Shell
login -> shell -> exit

Wenn ein command ausgeführt wird, wird ein fork (sub-process) erstellt, der den command ausführt und das Resultat anzeigt.

### IO
1. IN: Standart In
2. OUT
	1. Standart Out
	1. Standart Error

Changing the Standart In. eg.

< order > braucht ein File
```mail < myFile.txt  --shell will change the input of mail to myFile.txt```

```ls > myFile.txt --output of ls will NOT be displayed in shell, but in myFile.txt saved```

```ls 2> myFile.txt --std::out will go to shell, but errors to myFile.txt```

```ls 2> /dev/null```
```ls 2> /dev/cero```

```ls >> myFile.txt  --append output to myFile.txt```

| pipe wird über memory gemacht
```ls | more -- result of ls will be passed to command more```

xargs nimmt die übergebenen Argumente und setzt sie NACH dem nächsten Command
ergo: ```ls -l | xargs -0 rm -f```      wird zu   ```ls -l | rm -f xargs -0```
```grep -rliwZ | xargs -0 rm -f```

#### Sonderzeichen
```echo "Ich bin im Ordner: `pwd`" ```
```!echo --zeigt wie das letztemal der echo command verwendet wurde```
```!! -- redo last command```


### Verscheidene Prompts
- $ Normaler Nutzer
- "#" root
- > Es fehlt noch Eingabe

### Commands
```ls (command) -l (option) * (parameter)```

### Wildcards
- ```ls -l * --all files```
- ```ls -l ? --all files with one character```
- ```ls -l [a,c,g] --all files which start with a, c or g```
- ```ls -l [!a-z] --all files which aren't a to z```

## Networking
- Paketgrösse Unterschiedlich
- Keine n-m direkete Verbindung, Paket sucht sich den optimalen Pfad.
- Tragen Sequenznumbern, da ein Paket vor dem anderem kommen kann.

ipp == internet printing protocol

sudo netstat -avep |more 2> /dev/null

--Zeige an welcher Prozess gehört dieser Port
sudo lsof -i :43497

## Zugriffsrechte, Benutzer & Passworte
### Gruppen
Werden unter ```/etc/group``` gespeichert.

### Dateizugriffsrechte:
```
.       read - write - execute
owner    x     x         x
group    x     -         x
world    -     -         x
```

#### Secure-id bit
```drwxr-xr-x 1 root root .....```
Das "1" heisst, dass wenn das File ausgeführt wird

#### Löschen
Wenn man für den Ordner write rechte hat, kann man alle Files darunter löschen, falls man der Owner ist.

Software erstellt oft selber einen User, wenn sie erstellt wird. Somit kann man schön sehen z.B. wie viel Speicher das Programm verwendet, da alle Fies dem Benutzer "user-x" gehören.

### Löschen von Users
Man sollte einen User eingetlich nicht löschen, sondern einfach im ```/etc/passwd``` dass Passwort auf ein Zeichen setzten und die standart Bash auf null setzten.
Weil:
1. Falls der gelöschte User ein root-user war, ist er im ```/etc/sudoers.d``` immer noch vorhanden.
2. Man hatt die Files des Nutzers immer noch, somit hat man ein Backup.
3. Falls man einen neuen Nutzer erstellt, bekommt man vielleicht die gleiche User-Number. Somit hätte der neue Nutzer Zugriff auf alle alten Files des anderen Users.


## File system
### Allgemein
- Es gibt in Unix-FS keine Datentypen
- Inode, beinhaltet Verwaltungsinformationen etc. (aber NICHT den Namen des Files, das wird im Directory gespeichert)

### /etc/magic
Gewisse Dateien starten immer mit dem selbem Bit-Muster.
Das ist der einzige Weg zum erkennen von Datentypen.

### Commands
- ```df``` report file system disk space usage
- ```ln x y``` erstellt einen Hardlink
- ```ln -s x y``` erstellt einen Softlink
- ```ls -lsi``` zeigt alle files mit ihrem Inode Nummere
- ```stat myFile``` zeigt die Inode von myFile
- ```fdupes .``` findet alle gleiche Files mit dem Selbem Inhalt (also auch wenn nicht gleiche Inode Nummer)
- ```sync``` flush file system buffers

### Inode struktur


### FS-Aufbau
1. Partitionstabelle
2. Partition  
	2.1. Boot Abschnitt  
	2.2. Super block:  
		- Blockgrösse (in was für happen werden die Daten geholt);  
		- Anzahl Inodes
	2.3. Blockbitmap; Inotebitmap  
	2.4. Inodes  
	2.5. Datenblöcke

	### FS check
	- Flickt das FS, wenn etwas mit dem FS schiefleuft.v
	- Festplatten sind character und block devices, damit FS check im fall von Korrupten Blocks, FS check immer noch funktioniert.
	- Unter ```/lost+found``` finden Sie alle Files, die FS-check nicht zuordnen kann.
