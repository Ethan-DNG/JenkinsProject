#!/bin/bash
set -e  # on stoppe le script si une commande echoue

echo "=== Running Bubble Sort Tests ==="

# on compile le programme
make clean && make all

# on execute le programme et redirige la sortie vers un fichier
./bubble_sort > output.txt

attendu='=== Tests de tri avec différents types et ordres ===

1. Tri d entiers:
Tableau original: 64 34 25 12 22 11 90 
Tri croissant: 11 12 22 25 34 64 90 
Tri décroissant: 90 64 34 25 22 12 11 

2. Tri de chaînes de caractères:
Tableau original: "banana" "apple" "cherry" "date" "elderberry" 
Tri croissant: "apple" "banana" "cherry" "date" "elderberry" 
Tri décroissant: "elderberry" "date" "cherry" "banana" "apple" 

3. Tri alphanumérique:
Tableau original: "item2" "item10" "item1" "item20" "item3" 
Tri alphanumérique croissant: "item1" "item2" "item3" "item10" "item20" 
Tri alphanumérique décroissant: "item20" "item10" "item3" "item2" "item1" '

# on verifie si la sortie contient le texte attendu
if [ "$(cat output.txt)" = "$attendu" ]; then
  echo "Test réussi"
  exit 0
else
  echo "Test échoué"
  echo "=== Sortie obtenue ==="
  cat output.txt
  echo "=== Sortie attendue ==="
  echo "$attendu"
  exit 1
fi
