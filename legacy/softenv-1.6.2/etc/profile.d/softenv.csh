###############################################################################
#
#   SoftEnv
#
#   INSTRUCTIONS: Place me in /etc/profile.d
#                 To manually use, do a "source /etc/profile.d/softenv.csh"
#
if ( -x WHATAMI_BINARY ) then
    setenv WHATAMI `WHATAMI_BINARY`
else
    setenv WHATAMI unknown
endif
setenv PLATFORM ${WHATAMI}
setenv     ARCH ${WHATAMI}

if ( "`whoami`" != "root" ) then
    if ( ! -e ${HOME}/.nosoft ) then

        # Following replaced by config template_softfile
        ## If user doesn't own a SOFTENVRC file yet...
        #if ( ! -e ${HOME}/SOFTENVRC ) then
        #    if ( -e SOFTENV_ETC_DIR/softenvrc.default ) then
        #        #
        #        # ...give 'em one, if we can.
        #        cp SOFTENV_ETC_DIR/softenvrc.default ${HOME}/SOFTENVRC
        #    else
        #        #
        #        # If we can't, exit cleanly, without starting SoftEnv.
        #        exit 0
        #    endif
        #endif
    
        setenv SOFTENV_LOAD    SOFTENV_ETC_DIR/softenv-load.csh
        setenv SOFTENV_ALIASES SOFTENV_ETC_DIR/softenv-aliases.csh
        
        #
        # environment
        #
        if ( -r ${SOFTENV_LOAD} ) then
            source ${SOFTENV_LOAD}
        else
            echo "Unable to load SoftEnv system."
        endif
        
        #
        # aliases
        #
        if ( -r ${SOFTENV_ALIASES} ) then
            source ${SOFTENV_ALIASES}
        else
            echo "Unable to load SoftEnv system."
        endif
    endif
endif

