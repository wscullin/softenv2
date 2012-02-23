alias resoft 'set use_soft = "\!*"; if ( "$use_soft" == "" ) set use_soft = SOFTENVRC; SOFTENV_PREFIX/bin/soft-msc $use_soft; if ( -e ${HOME}/${use_soft}.cache.csh ) source ${HOME}/${use_soft}.cache.csh ; if ( -e /.${use_soft}.cache.csh ) source ${use_soft}.cache.csh ; unset use_soft'

alias soft 'eval "`SOFTENV_PREFIX/bin/soft-dec csh \!*`"'

alias softcheck 'set use_soft = "\!*"; if ( "$use_soft" == "" ) set use_soft = SOFTENVRC; SOFTENV_PREFIX/bin/soft-msd -t; SOFTENV_PREFIX/bin/soft-msc -t $use_soft; if ( -e ${HOME}/${use_soft}.cache.csh ) source ${HOME}/${use_soft}.cache.csh ; if ( -e /.${use_soft}.cache.csh ) source ${use_soft}.cache.csh ; unset use_soft'

alias softmenu 'SOFTENV_PREFIX/bin/soft-menu-select csh \!* ; eval "`SOFTENV_PREFIX/bin/soft-menu-change csh \!* $?`"'
