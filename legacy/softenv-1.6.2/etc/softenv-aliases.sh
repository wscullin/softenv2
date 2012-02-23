resoft() {
  use_soft=$1
  if [ "$use_soft" = "" ]; then
    use_soft="SOFTENVRC"
  fi
  SOFTENV_PREFIX/bin/soft-msc $use_soft
  if [ -e ${HOME}/${use_soft}.cache.sh ]; then
    . ${HOME}/${use_soft}.cache.sh
  fi
  if [ -e /.${use_soft}.cache.sh ]; then
    . ${use_soft}.cache.sh
  fi
  unset use_soft
} 

soft() {
  eval "`SOFTENV_PREFIX/bin/soft-dec sh $1 $2`"
}

softcheck() {
  use_soft=$1
  if [ "$use_soft" = "" ]; then
    use_soft="SOFTENVRC"  
  fi
  SOFTENV_PREFIX/bin/soft-msd -t
  SOFTENV_PREFIX/bin/soft-msc -t $use_soft
  if [ -e ${HOME}/${use_soft}.cache.sh ]; then
    . ${HOME}/${use_soft}.cache.sh
  fi
  if [ -e /.${use_soft}.cache.sh ]; then
    . ${use_soft}.cache.sh
  fi
  unset use_soft
}

softmenu() {
  SOFTENV_PREFIX/bin/soft-menu-select sh $1
  eval "`SOFTENV_PREFIX/bin/soft-menu-change sh $1 $?`"
}
