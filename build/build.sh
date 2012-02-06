#!/bin/sh

TUBAINA_HOME=/home/csokol/caelum/tubaina/tubaina-build/



java -jar $TUBAINA_HOME/tubaina-1.8-SNAPSHOT.jar --latex -i ../ -o out/ -n "exemplo"

$TUBAINA_HOME/etc/latex.sh out/book.tex

cp out/book.pdf /tmp



