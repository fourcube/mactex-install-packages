#!/bin/bash
if [ $# -lt 1 ]; then
	echo "" 
	echo ""
	echo "install_tex_pkgs.sh"
	echo "-----"
	echo "usage: install_tex_pkgs.sh <document.tex>"
	echo "-----"
	echo "Extracts used packages from a .tex file and installs them using 'tlmgr'."
	echo "" 
	echo ""
	exit -1
fi

PKGS=`sed -nE "s/.*\\usepackage(\[.*\])?\{(.*)\}.*/\\2/p" $1`
PKGLIST=""

for PKG in $PKGS; do
	PKGLIST="$PKGLIST $PKG"
done;

CMD="sudo tlmgr install $PKGLIST"
echo "Running $CMD..."

`$CMD`