################################################################################
#
# batocera-led-handheld
#
################################################################################

BATOCERA_LED_HANDHELD_VERSION = 1.1
BATOCERA_LED_HANDHELD_LICENSE = LGPL
BATOCERA_LED_HANDHELD_SOURCE =
BATOCERA_LED_HANDHELD_DEPENDENCIES = python-batocera-common

define BATOCERA_LED_HANDHELD_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(BATOCERA_LED_HANDHELD_PKGDIR)/batoled.py $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/batoled.py
	$(INSTALL) -D -m 0755 $(BATOCERA_LED_HANDHELD_PKGDIR)/batocera-led-handheld.py $(TARGET_DIR)/usr/bin/batocera-led-handheld
	$(INSTALL) -D -m 0755 $(BATOCERA_LED_HANDHELD_PKGDIR)/S21led-handheld $(TARGET_DIR)/etc/init.d/S21led-handheld
	$(INSTALL) -D -m 0755 $(BATOCERA_LED_HANDHELD_PKGDIR)/95led-handheld  $(TARGET_DIR)/etc/pm/sleep.d/95led-handheld
endef

$(eval $(generic-package))
