################################################################################
#
# unclutter
#
################################################################################
# Version: Commits on Aug 13, 2019
UNCLUTTER_VERSION = v1.5-batocera
UNCLUTTER_SOURCE = $(UNCLUTTER_VERSION).tar.gz
UNCLUTTER_SITE = https://github.com/batocera-linux/unclutter-xfixes/archive/refs/tags
UNCLUTTER_LICENSE = MIT
UNCLUTTER_DEPENDENCIES = xserver_xorg-server libev

UNCLUTTER_CFLAGS="-I$(@D)/include -D'__VERSION=\"$(UNCLUTTER_VERSION)\"'"
UNCLUTTER_LDFLAGS="-lev -lX11 -lXi -lXfixes"

define UNCLUTTER_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
		CFLAGS=$(UNCLUTTER_CFLAGS) LDFLAGS=$(UNCLUTTER_LDFLAGS) unclutter
endef

define UNCLUTTER_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/unclutter $(TARGET_DIR)/usr/bin/unclutter
	$(INSTALL) -D $(@D)/bin/unclutter-remote $(TARGET_DIR)/usr/bin/unclutter-remote
endef

$(eval $(generic-package))
