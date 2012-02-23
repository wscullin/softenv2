# softenv-load.csh
# The code that loads the SoftEnv system.
#
# This should be sourced from the /etc/ shell default files for [t]csh.
# This brings the SOFTENVRC cache up to date, and then sources it.
#
# (This file is designed to modify the user's environment, and therefore
# must be source'd, not executed.)




# ===========================================================================
# Set up variables
# ===========================================================================

# grab the settings from the config file
# softenv.config.pl must be in the same directory

set config_file = SOFTENV_ETC_DIR/softenv.config.pl

eval `grep '^\$' $config_file | sed -e 's/\$\W*/set /'`

set noglob	# No csh name globbing

set softfile   = $default_softfile
set cachef     = $HOME/SOFTENVRC.cache.csh
set softname   = "$package_name $version"

alias softcheck 'set use_soft = "\!*"; if ( "$use_soft" == "" ) set use_soft = SOFTENVRC; SOFTENV_PREFIX/bin/soft-msd -t; SOFTENV_PREFIX/bin/soft-msc -t $use_soft; if ( -e ${HOME}/${use_soft}.cache.csh ) source ${HOME}/${use_soft}.cache.csh ; if ( -e /.${use_soft}.cache.csh ) source ${use_soft}.cache.csh ; unset use_soft'

alias softmenu 'SOFTENV_PREFIX/bin/soft-menu-select csh \!* ; eval "`SOFTENV_PREFIX/bin/soft-menu-change csh \!* $?`"'

# ===========================================================================
# Preliminary checks
#   Issue any warnings
#   Look for SOFTENVRC, check dates.
#   Create one if we're missing one.
# ===========================================================================

# If the user has home dir / or a .nosoft file or is root, exit immediately
if ( "$HOME" == "/" || -f "$nosoftfile" || "$USER" == "root" ) then
else

# Issue a warning if there exists a .software of .software-beta file
# This isn't a concern, more of a notice to the user
  if ( $?prompt ) then
    if ( -r $HOME/.software-beta || -r $HOME/.software ) then
      echo "$softname warning:"
      echo "  You have a .software or .software-beta file.  However, this"
      echo "  system is using your SOFTENVRC file to build your environment."
    endif
  endif


# To make the logic of this program more readable, these two variables
# will be set if we want to run the SOFTENVRC.cache.sh file or soft-msc
# The default is that we want to run the cache but not msc
  set runcache = "YES"
  set runmsc   = "NO"


# If a user doesn't have a softfile create one based on a defined template
  if ( ! -e "$softfile" && -r "$template_softfile" ) then
    cp $template_softfile $softfile
  endif


# If the SOFTENVRC.cache.sh file doesn't exist, or if the time conditions are
# true, then we want to run soft-msc
  if ( -r $cachef ) then
    if ( "`find $softfile -newer $cachef -print`" != "" || "`find $system_db -newer $cachef -print`" != "" ) then
      set runmsc="YES"
    endif
  else
     set runmsc="YES"
  endif


# If runmsc="YES", then run the soft-msc program, which will return values
# that determine if we want to run the cache
  if ( "$runmsc" == "YES" ) then
#   if ($?prompt) then
#     echo "$softname"": updating your software environment, one moment..."
#   endif

    ${prefix}/bin/soft-msc -s ${softfile}

    switch ($status)
      case 1:
        echo "$softname system error: unspecific error"
        set runcache = "NO"
        breaksw
      case 2:
        echo "$softname system error: weird environment.  are you root?"
        set runcache = "NO"
        breaksw
      case 3:
        echo "$softname system error: could not create the file: $cachef"
        set runcache = "NO"
        breaksw
      case 4:
        echo "$softname system error: errors occured in writing $cachef"
        set runcache = "NO"
        breaksw
      case 5:
        echo "$softname system error: $cachef was locked"
        echo "Try deleting any files ending in .lock and running resoft"
        set runcache = "NO"
        breaksw
      case 10:
        if ($?prompt) then
          echo "$softname system warning: no SOFTENVRC was found"
        endif
        breaksw
      case 11:
        if ($?prompt) then
          echo "$softname system warning: some words were not recognized"
          echo "Examine $cachef for error details."
        endif
        breaksw
      case 12:
        if ($?prompt) then
          echo "$softname system warning: $cachef was locked"
          echo "However, it appeared to be old and execution was completed"
        endif
        breaksw
    endsw
  endif


# Source the SOFTENVRC.cache.sh file if the rest of this script went smoothly
  if ( "$runcache" == "YES" ) then
    source $cachef
  endif


# and unset the variables that we used
endif
unset noglob softfile cachef softname runcache runmsc
unset package_name version prefix dbpath system_db beta_db auto_db
unset database default_softfile nosoftfile test_database htmllog
