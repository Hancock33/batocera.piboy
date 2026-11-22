################################################################################
#
# touchegg
#
################################################################################
# Version: Commits on May 24, 2025
TOUCHEGG_VERSION = 2.0.18
TOUCHEGG_SITE = $(call github,JoseExposito,touchegg,$(TOUCHEGG_VERSION))
TOUCHEGG_LICENSE = GPL-3.0+
TOUCHEGG_LICENSE_FILES = COPYING
TOUCHEGG_DEPENDENCIES = xapp_xinput pugixml cairo libinput xlib_libXtst

TOUCHEGG_CONF_OPTS += -DCMAKE_INSTALL_PREFIX=$(STAGING_DIR)/usr/ -DUSE_SYSTEMD=0

define TOUCHEGG_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/touchegg $(TARGET_DIR)/usr/bin/touchegg
	$(INSTALL) -D -m 0644 $(TOUCHEGG_PKGDIR)/touchegg.conf $(TARGET_DIR)/usr/share/touchegg/touchegg.conf
	mkdir -p $(TARGET_DIR)/etc/xdg
	ln -sfn /usr/share/touchegg $(TARGET_DIR)/etc/xdg/touchegg
endef

$(eval $(cmake-package))
