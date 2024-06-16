################################################################################
#
# xkbd
#
################################################################################
# Version: Commits on Jan 09, 2024
XKBD_VERSION = 0.8.18-860-gec90622f58c5b69f2b94d47a607649b38e943afb
XKBD_SOURCE = xkbd-$(XKBD_VERSION).tar.gz
XKBD_SITE = https://github.com/mahatma-kaganovich/xkbd.git
XKBD_SITE_METHOD=git
XKBD_DEPENDENCIES = xlib_libXpm xlib_libXft
XKBD_LICENSE = MIT
XKBD_LICENSE_FILES = COPYING
XKBD_CONF_OPTS = --disable-debug

define XKBD_AUTOCONFIG
	$(SED) 's,\[,#,g' $(@D)/data/mk.sh
	cd $(@D) && autoreconf -f -i
endef

XKBD_PRE_CONFIGURE_HOOKS += XKBD_AUTOCONFIG

$(eval $(autotools-package))
