################################################################################
#
# xwiimote
#
################################################################################
# Version: Commits on Feb 29, 2024
XWIIMOTE_VERSION = 4df713d9037d814cc0c64197f69e5c78d55caaf1
XWIIMOTE_SITE = $(call github,xwiimote,xwiimote,$(XWIIMOTE_VERSION))

XWIIMOTE_DEPENDENCIES = udev

define XWIIMOTE_AUTOGEN
	cd $(@D); PKG_CONFIG="$(HOST_DIR)/usr/bin/pkg-config" ./autogen.sh
endef

XWIIMOTE_PRE_CONFIGURE_HOOKS += XWIIMOTE_AUTOGEN

$(eval $(autotools-package))
