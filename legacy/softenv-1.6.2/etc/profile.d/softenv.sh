###############################################################################
#
#   SoftEnv
#
#   INSTRUCTIONS: Place me in /etc/profile.d
#                 To manually use, do a "source /etc/profile.d/softenv.sh"
#
if [ -x WHATAMI_BINARY ] ; then
    export WHATAMI=`WHATAMI_BINARY`
else
    export WHATAMI=unknown
fi
export PLATFORM=$WHATAMI
export     ARCH=$WHATAMI

if [ "`whoami`" != "root" ] ; then
    if [ ! -e $HOME/.nosoft ] ; then

        # Following replaced by config template_softfile
        ## If user doesn't own a SOFTENVRC file yet...
        #if [ ! -e ${HOME}/SOFTENVRC ]; then
        #    if [ -e SOFTENV_ETC_DIR/softenvrc.default ]; then
        #        #
        #        # ...give 'em one, if we can.
        #        cp SOFTENV_ETC_DIR/softenvrc.default ${HOME}/SOFTENVRC
        #    else
        #        #
        #        # If we can't, exit cleanly, without starting SoftEnv.
        #        exit 0
        #    fi
        #fi
    
        SOFTENV_LOAD=SOFTENV_ETC_DIR/softenv-load.sh
        export SOFTENV_LOAD
        SOFTENV_ALIASES=SOFTENV_ETC_DIR/softenv-aliases.sh
        export SOFTENV_ALIASES
        
        #
        # environment
        #
        if [ -r ${SOFTENV_LOAD} ] ; then
            source ${SOFTENV_LOAD}
        else
            echo "Unable to load SoftEnv system."
        fi
        
        #
        # aliases
        #
        if [ -r ${SOFTENV_ALIASES} ] ; then
            source ${SOFTENV_ALIASES}
        else
            echo "Unable to load SoftEnv system."
        fi
    fi
fi

