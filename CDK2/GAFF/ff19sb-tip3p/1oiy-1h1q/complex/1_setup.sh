#!/bin/sh

windows=$(seq 0 0.05 1)

: > mbar.dat

for w in $windows; do
  if [ \! -x $w ]; then
    mkdir $w
  fi

  echo $w >> mbar.dat

  sed -e "s/%L1%/$w/" min.in.tmpl > $w/min.in.tmpl

  sed -e "s/%L1%/$w/" eq.in.tmpl > $w/eq.in.tmpl
  sed -e "s/%L1%/$w/" ti.in.tmpl > $w/ti.in.tmpl
  (cd $w; ln -sf ../mbar.dat)
done
