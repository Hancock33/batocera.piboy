################################################################################
#
# batocera-wheel-calibrator
#
################################################################################

BATOCERA_WHEEL_CALIBRATOR_VERSION = 1
BATOCERA_WHEEL_CALIBRATOR_LICENSE = GPL
BATOCERA_WHEEL_CALIBRATOR_SOURCE =

define BATOCERA_WHEEL_CALIBRATOR_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(BATOCERA_WHEEL_CALIBRATOR_PKGDIR)/batocera-wheel-calibrator $(TARGET_DIR)/usr/bin/batocera-wheel-calibrator
endef

$(eval $(generic-package))
