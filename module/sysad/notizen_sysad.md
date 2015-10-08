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
```ls -l * --all files```
```ls -l ? --all files with one character```
```ls -l [a,c,g] --all files which start with a, c or g```
```ls -l [!a-z] --all files which aren't a to z```

## Networking
- Paketgrösse Unterschiedlich
- Keine n-m direkete Verbindung, Paket sucht sich den optimalen Pfad.
- Tragen Sequenznumbern, da ein Paket vor dem anderem kommen kann.

ipp == internet printing protocol

sudo netstat -avep |more 2> /dev/null

--Zeige an welcher Prozess gehört dieser Port
sudo lsof -i :43497
