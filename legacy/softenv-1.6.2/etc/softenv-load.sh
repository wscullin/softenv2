# softenv-load.sh
# The code that loads the SoftEnv system.
#
# This should be sourced from the /etc/ shell default files for {z,ba,}sh.
# This brings the SOFTENVRC cache up to date, and then sources it
#
# (This file is designed to modify the user's environment, and therefore
# must be source'd, not executed.)



# ===========================================================================
# Set up variables
# ===========================================================================

# grab the settings from the config file
# softenv.config.pl must be in the same directory

config_file=SOFTENV_ETC_DIR/softenv.config.pl

eval "`grep '^\\\$' \$config_file | sed -e 's/\\\$\\W*//' -e 's/ //g'`"

softfile=$default_softfile
cachef=$HOME/SOFTENVRC.cache.sh
softname="$package_name $version"

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

# ===========================================================================
# Preliminary checks
#   Issue any warnings
#   Look for SOFTENVRC, check dates.
#   Create one if we're missing one.
# ===========================================================================

# If the user has home dir / or a .nosoft file or is root, exit immediately
if [ ! "$HOME" = "/" -a ! -f "$nosoftfile" -a ! "$USER" = "root" ] ; then


# Issue a warning if there exists a .software of .software-beta file
# This isn't a concern, more of a notice to the user
  if [ $?prompt ] ; then
    if [ -r $HOME/.software-beta -o -r $HOME/.software ] ; then
      echo "$softname warning:"
      echo "  You have a .software or .software-beta file.  However, this"
      echo "  system is using your SOFTENVRC file to build your environment."
    fi
  fi


# To make the logic of this program more readable, these two variables
# will be set if we want to run the SOFTENVRC.cache.sh file or soft-msc
  runcache="YES"
  runmsc="NO"


# If a user doesn't have a softfile create one based on a defined template
  if [ ! -e "$softfile" -a -r "$template_softfile"  ] ; then
    cp $template_softfile $softfile
  fi


# If the SOFTENVRC.cache.sh file doesn't exist, or if the time conditions are
# true, then we want to run soft-msc
  if [ -r "$cachef" -a -s "$cachef" ] ; then
    if [ "`find $softfile -newer $cachef -print`" != "" ] || [ "`find $system_db -newer $cachef -print`" != "" ] ; then
      runmsc="YES"
    fi
  else
    runmsc="YES"
  fi


# If runmsc="YES", then run the soft-msc program, which will return values
# that determine if we want to run the cache
  if [ "$runmsc" = "YES" ]; then
#   if [ $?prompt ]; then
#     echo "$softname: updating your software environment, one moment..."
#   fi

    ${prefix}/bin/soft-msc -s ${softfile}

    case $? in
      1)
        echo "$softname system error: unspecific error"
        runcache="NO"
        ;;
      2)
        echo "$softname system error: weird environment.  are you root?"
        runcache="NO"
        ;;
      3)
        echo "$softname system error: could not create the file: $cachef"
        runcache="NO"
        ;;
      4)
        echo "$softname system error: errors occured in writing $cachef"
        runcache="NO"
        ;;
      5)
        echo "$softname system error: $cachef was locked"
        echo "Try deleting any files ending in .lock and running resoft"
        runcache="NO"
        ;;
      10)
        if [ $?prompt ]; then
          echo "$softname system warning: no SOFTENVRC was found"
        fi
        ;;
      11)
        if [ $?prompt ]; then
          echo "$softname system warning: some words were not recognized"
          echo "Examine $cachef for error details."
        fi
        ;;
      12)
        if [ $?prompt ]; then
          echo "$softname system warning: $cachef was locked."
          echo "However, it appeared to be old and execution was completed"
        fi
        ;;
    esac
  fi


# Source the SOFTENVRC.cache.sh file if the rest of this script went smoothly
  if [ "$runcache" = "YES" ]; then 
    . $cachef
  fi


# and unset the variables that we used
fi
unset softfile cachef softname runcache runmsc
unset package_name version prefix dbpath system_db beta_db auto_db
unset database default_softfile nosoftfile test_database htmllog

