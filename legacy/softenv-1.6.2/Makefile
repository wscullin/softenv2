# 
# This Makefile is used to build and install SoftEnv.
#
# 	$Id: Makefile,v 1.15 2007/03/07 03:30:38 navarro Exp $
#

################################################################################
#
# Variables
#
################################################################################

PERLPATH 		:= $(shell which perl)
WHATAMI_BINARY 	:= $(shell which whatami)
VERSION 		:= $(shell cat VERSION)
TOPDIR  		:= $(CURDIR)
INSTALL_N_SUB	:= $(TOPDIR)/scripts/install-N-sub
INS_CONF 		:= install-N-sub.conf.tmp

TARBALL			:= $(TOPDIR)/tmp/softenv-$(VERSION).tar.bz2
RPM_DIR			:= /usr/src/packages

PREFIX			:= /usr/local

EXEC_PREFIX		:= $(PREFIX)
BIN_DIR			:= $(EXEC_PREFIX)/bin

ETC_DIR			:= $(PREFIX)/etc
PROFILE_DIR		:= $(ETC_DIR)/profile.d
SOFTENVRC		:= .soft

DOC_DIR			:= $(PREFIX)/share/doc/softenv-$(VERSION)
HTML_DIR		:= $(DOC_DIR)/html
TXT_DIR			:= $(DOC_DIR)/txt

MAN_DIR			:= $(PREFIX)/man

HTML_DOCS		= $(shell cd docs/html && ls)
MAN_DOCS 		= $(shell cd docs/man && ls)
TXT_DOCS 		= $(shell cd docs/txt && ls)

BIN_FILES_775 	:= 	code/soft-msc \
					code/soft-dec \
					code/soft-menu-change \
					code/soft-menu-select \
					code/soft-dbq \
					code/softenv

BIN_FILES_774 	:= 	code/soft-mad \
					code/soft-mwl \
					code/soft-msd

ETC_FILES_664	:=	etc/softenv-load.csh \
					etc/softenv-load.sh \
					etc/softenv-aliases.csh \
					etc/softenv-aliases.sh \
					etc/softenv.config.pl \
					etc/softenvrc.default.example \
					etc/softenv.db.example \
					etc/softenv.db.example-complex \
					etc/softenv-local.db.example-complex

PROFILE_D_FILES	:=	etc/profile.d/softenv.sh \
					etc/profile.d/softenv.csh


################################################################################
#
# Targets
#
################################################################################

PHONY += help
help:
	@echo
	@echo 'Available Targets Include:'
	@echo '  make all'
	@echo '  make install'
	@echo '  make docs'
	@echo '  make clean'
	@echo '  make distclean (same as clean)'
	@echo '  make tarball'
	@echo '  make rpm'
	@echo


PHONY += all
all:	docs $(INS_CONF)

PHONY += docs
docs:
	$(MAKE) -C ./docs/ all
 
PHONY += $(INS_CONF)
$(INS_CONF):
	cat  install-N-sub.conf              	    >  $(INS_CONF)
	echo "SOFTENV_PREFIX    $(PREFIX)"   	    >> $(INS_CONF)
	echo "SOFTENV_VERSION   $(VERSION)"   	    >> $(INS_CONF)
	echo "SOFTENVRC    	$(SOFTENVRC)"  	    >> $(INS_CONF)
	echo "!PERL_PATH!  	$(PERLPATH)" 	    >> $(INS_CONF)
	echo "SOFTENV_ETC_DIR  	$(ETC_DIR)"  	    >> $(INS_CONF)
	echo "WHATAMI_BINARY  	$(WHATAMI_BINARY)"  >> $(INS_CONF)

PHONY += clean
clean:
	rm -f $(INS_CONF)
	rm -fr $(TOPDIR)/tmp
	$(MAKE) -C $(TOPDIR)/docs/ clean

PHONY += distclean
distclean:	clean

PHONY += install
install:	all
	#
	# Directories
	#
	[ -d $(BIN_DIR) ]           || mkdir -p -m 755 $(BIN_DIR)
	[ -d $(HTML_DIR) ]          || mkdir -p -m 755 $(HTML_DIR)
	[ -d $(ETC_DIR) ]           || mkdir -p -m 755 $(ETC_DIR)
	[ -d $(PROFILE_DIR) ]       || mkdir -p -m 755 $(PROFILE_DIR)
	[ -d $(MAN_DIR) ]           || mkdir -p -m 755 $(MAN_DIR)
	[ -d $(MAN_DIR)/man1 ]      || mkdir -p -m 755 $(MAN_DIR)/man1
	[ -d $(TXT_DIR) ]           || mkdir -p -m 755 $(TXT_DIR)

	#
	# BIN_FILES_775
	#
	$(foreach file, $(BIN_FILES_775), $(INSTALL_N_SUB) -c $(INS_CONF) -i '-m 775' -d $(BIN_DIR) $(file);)

	#
	# BIN_FILES_774
	#
	$(foreach file, $(BIN_FILES_774), $(INSTALL_N_SUB) -c $(INS_CONF) -i '-m 774' -d $(BIN_DIR) $(file);)

	#
	# ETC_FILES_664
	#
	$(foreach file, $(ETC_FILES_664), $(INSTALL_N_SUB) -c $(INS_CONF) -i '-m 664' -d $(ETC_DIR) $(file);)

	#
	# PROFILE_D_FILES
	#
	$(foreach file, $(PROFILE_D_FILES), $(INSTALL_N_SUB) -c $(INS_CONF) -i '-m 755' -d $(PROFILE_DIR) $(file);)

	#
	# HTML_DOCS
	#
	$(foreach file, $(HTML_DOCS), $(INSTALL_N_SUB) -c $(INS_CONF) -i '-m 664' -d $(HTML_DIR)      docs/html/$(file) ;)
	$(foreach file, $(MAN_DOCS),  $(INSTALL_N_SUB) -c $(INS_CONF) -i '-m 664' -d $(MAN_DIR)/man1  docs/man/$(file)  ;)
	$(foreach file, $(TXT_DOCS),  $(INSTALL_N_SUB) -c $(INS_CONF) -i '-m 664' -d $(TXT_DIR)       docs/txt/$(file)  ;)

	touch $(ETC_DIR)/softenv.db

	$(BIN_DIR)/soft-msd


PHONY += tarball
tarball:	$(TARBALL).md5sum

$(TARBALL).md5sum:	$(TARBALL)
	@echo
	cd $(TOPDIR)/tmp && md5sum $(TARBALL) > $(TARBALL).md5sum
	@echo
	
$(TARBALL):
	@echo
	rm -f $(TARBALL).md5sum
	rm -f $(TARBALL)
	rm -fr $(TOPDIR)/tmp/softenv-$(VERSION)

	@echo
	mkdir -p $(TOPDIR)/tmp/softenv-$(VERSION)
	rsync -a --exclude tmp/ $(TOPDIR)/ $(TOPDIR)/tmp/softenv-$(VERSION)

	@echo
	$(MAKE) -C $(TOPDIR)/tmp/softenv-$(VERSION) distclean

	@echo
	rm -fr `find $(TOPDIR)/tmp/softenv-$(VERSION) -name CVS -type d`

	@echo
	tar -C $(TOPDIR)/tmp -cjf $(TARBALL) softenv-$(VERSION)


PHONY += rpm
rpm:	tarball $(INS_CONF)
	cp $(TARBALL) $(RPM_DIR)/SOURCES
	$(INSTALL_N_SUB) -c $(INS_CONF) -i '-m 664' -d $(RPM_DIR)/SPECS $(TOPDIR)/softenv.spec
	rpm -ba $(RPM_DIR)/SPECS/softenv.spec


.PHONY:		$(PHONY)

