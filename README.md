# Ricerca-Operativa

## Comando per compilare

Questo comando crea due file, un `.out` con l'output e un `.sens` con l'analisi di sensitività a partire dal file `.mod` dato in input nell'ultima riga `solve modello.mod`

```bash
#!/bin/sh

solve() {
       fin=$1
       fout="${fin%.*}.out"
       fsens="${fin%.*}.sens"
       glpsol --cover --clique --gomory --mir -m "$fin" -o "$fout" --ranges "$fsens" && cat "$fout"
}

solve "$1"
```
