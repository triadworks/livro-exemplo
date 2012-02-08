
. config.sh

TEMPLATE=$TEMPLATES_TUBAINA/templatesCaelumLivro24x17/

# Lugar temporÃ¡rio
TMP=/tmp/build-livro-exemplo/

SRC=`pwd`/../../src/

DATE=`date +%Y%m%d`

# faz diretorios
rm -rf "$TMP"
mkdir -p "$TMP"
mkdir -p "$OUTPUT_DIR"

# seta ambiente
export TUBAINA_HOME="$TUBAINA"
javapath="$(whereis java)"
export JAVA_HOME="${javapath/\/bin\/java//}"

cd "${TUBAINA}/"
java -cp ${TUBAINA}/tubaina-1.8-SNAPSHOT.jar br.com.caelum.tubaina.Tubaina -latex \
  -i "$SRC" -o "$TMP" -n "$TITLE" -t "$TEMPLATE" \
  $(test "$TIPO" = "instrutor" && echo "-s") \
  $(test "$COMRESPOSTA" = "false" && echo "-a")

if [ "$?" != 0 ]; then
  echo "\x1B[31;1mDeu pau ao rodar o Tubaina"
  exit -1
fi

cp -R ~/.tubaina/pythonenv $TMP/latex/
cd $TMP/latex/
bash "$TUBAINA"/etc/latex.sh book.tex


FINAL_PDF=$OUTPUT_DIR/$TITLE-$DATE.pdf

mv book.pdf $FINAL_PDF
echo $FINAL_PDF

