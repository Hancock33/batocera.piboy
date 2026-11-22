################################################################################
#
# batocera-battery-checker
#
################################################################################

BATOCERA_BATTERY_CHECKER_VERSION = 1.1
BATOCERA_BATTERY_CHECKER_LICENSE = GPL
BATOCERA_BATTERY_CHECKER_SOURCE =

define BATOCERA_BATTERY_CHECKER_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(BATOCERA_BATTERY_CHECKER_PKGDIR)/batocera-battery-checker $(TARGET_DIR)/usr/bin/batocera-battery-checker
	$(INSTALL) -D -m 0755 $(BATOCERA_BATTERY_CHECKER_PKGDIR)/batocera-battery-checker.service $(TARGET_DIR)/etc/init.d/S90battery_checker
endef

$(eval $(generic-package))
