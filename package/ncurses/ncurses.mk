#############################################################
#
# ncurses
# this installs only a few vital termcap entries
#
#############################################################

NCURSES_VERSION = 5.9
NCURSES_SITE = $(BR2_GNU_MIRROR)/ncurses
NCURSES_INSTALL_STAGING = YES
NCURSES_DEPENDENCIES = host-ncurses
NCURSES_LICENSE = MIT with advertising clause
NCURSES_LICENSE_FILES = README
NCURSES_CONFIG_SCRIPTS = ncurses5-config

NCURSES_CONF_OPT = \
	$(if $(BR2_PREFER_STATIC_LIB),--without-shared,--with-shared) \
	--without-cxx \
	--without-cxx-binding \
	--without-ada \
	--without-progs \
	--without-tests \
	--disable-big-core \
	--without-profile \
	--disable-rpath \
	--disable-rpath-hack \
	--enable-echo \
	--enable-const \
	--enable-overwrite \
	--enable-pc-files \
	$(if $(BR2_HAVE_DOCUMENTATION),,--without-manpages)

ifneq ($(BR2_ENABLE_DEBUG),y)
NCURSES_CONF_OPT += --without-debug
endif


define NCURSES_BUILD_CMDS
	$(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR)
endef

ifeq ($(BR2_HAVE_DEVFILES),y)
define NCURSES_INSTALL_TARGET_DEVFILES
	mkdir -p $(TARGET_DIR)/usr/include
	cp -dpf $(NCURSES_DIR)/include/curses.h $(TARGET_DIR)/usr/include/curses.h
	cp -dpf $(NCURSES_DIR)/include/ncurses_dll.h $(TARGET_DIR)/usr/include/ncurses_dll.h
	cp -dpf $(NCURSES_DIR)/include/term.h $(TARGET_DIR)/usr/include/
	cp -dpf $(NCURSES_DIR)/include/unctrl.h $(TARGET_DIR)/usr/include/
	cp -dpf $(NCURSES_DIR)/include/termcap.h $(TARGET_DIR)/usr/include/
	cp -dpf $(NCURSES_DIR)/lib/libncurses.a $(TARGET_DIR)/usr/lib/
	(cd $(TARGET_DIR)/usr/lib; \
	 ln -fs libncurses.a libcurses.a; \
	 ln -fs libncurses.a libtermcap.a; \
	)
	(cd $(TARGET_DIR)/usr/include; ln -fs curses.h ncurses.h)
	rm -f $(TARGET_DIR)/usr/lib/libncurses.so
	(cd $(TARGET_DIR)/usr/lib; ln -fs libncurses.so.$(NCURSES_VERSION) libncurses.so)
endef
endif

ifneq ($(BR2_PREFER_STATIC_LIB),y)

ifeq ($(BR2_PACKAGE_NCURSES_TARGET_PANEL),y)
define NCURSES_INSTALL_TARGET_PANEL
	cp -dpf $(NCURSES_DIR)/lib/libpanel.so* $(TARGET_DIR)/usr/lib/
endef
endif

ifeq ($(BR2_PACKAGE_NCURSES_TARGET_FORM),y)
define NCURSES_INSTALL_TARGET_FORM
	cp -dpf $(NCURSES_DIR)/lib/libform.so* $(TARGET_DIR)/usr/lib/
endef
endif

ifeq ($(BR2_PACKAGE_NCURSES_TARGET_MENU),y)
define NCURSES_INSTALL_TARGET_MENU
	cp -dpf $(NCURSES_DIR)/lib/libmenu.so* $(TARGET_DIR)/usr/lib/
endef
endif

endif

define NCURSES_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib
	$(if $(BR2_PREFER_STATIC_LIB),,cp -dpf $(NCURSES_DIR)/lib/libncurses.so* $(TARGET_DIR)/usr/lib/)
	$(NCURSES_INSTALL_TARGET_PANEL)
	$(NCURSES_INSTALL_TARGET_FORM)
	$(NCURSES_INSTALL_TARGET_MENU)
	ln -snf /usr/share/terminfo $(TARGET_DIR)/usr/lib/terminfo
	mkdir -p $(TARGET_DIR)/usr/share/terminfo/x
	cp -dpf $(STAGING_DIR)/usr/share/terminfo/x/xterm $(TARGET_DIR)/usr/share/terminfo/x
	cp -dpf $(STAGING_DIR)/usr/share/terminfo/x/xterm-color $(TARGET_DIR)/usr/share/terminfo/x
	cp -dpf $(STAGING_DIR)/usr/share/terminfo/x/xterm-xfree86 $(TARGET_DIR)/usr/share/terminfo/x
	mkdir -p $(TARGET_DIR)/usr/share/terminfo/v
	cp -dpf $(STAGING_DIR)/usr/share/terminfo/v/vt100 $(TARGET_DIR)/usr/share/terminfo/v
	cp -dpf $(STAGING_DIR)/usr/share/terminfo/v/vt102 $(TARGET_DIR)/usr/share/terminfo/v
	cp -dpf $(STAGING_DIR)/usr/share/terminfo/v/vt200 $(TARGET_DIR)/usr/share/terminfo/v
	cp -dpf $(STAGING_DIR)/usr/share/terminfo/v/vt220 $(TARGET_DIR)/usr/share/terminfo/v
	mkdir -p $(TARGET_DIR)/usr/share/terminfo/a
	cp -dpf $(STAGING_DIR)/usr/share/terminfo/a/ansi $(TARGET_DIR)/usr/share/terminfo/a
	mkdir -p $(TARGET_DIR)/usr/share/terminfo/l
	cp -dpf $(STAGING_DIR)/usr/share/terminfo/l/linux $(TARGET_DIR)/usr/share/terminfo/l
	mkdir -p $(TARGET_DIR)/usr/share/terminfo/s
	cp -dpf $(STAGING_DIR)/usr/share/terminfo/s/screen $(TARGET_DIR)/usr/share/terminfo/s
	$(NCURSES_INSTALL_TARGET_DEVFILES)
endef # NCURSES_INSTALL_TARGET_CMDS

#
# On systems with an older version of tic, the installation of ncurses hangs
# forever. To resolve the problem, build a static version of tic on host
# ourselves, and use that during installation.
#
define HOST_NCURSES_BUILD_CMDS
	$(MAKE1) -C $(@D) sources
	$(MAKE) -C $(@D)/progs tic
endef

HOST_NCURSES_CONF_OPT = \
	--without-shared --without-gpm \
	--without-manpages

$(eval $(autotools-package))
$(eval $(host-autotools-package))
