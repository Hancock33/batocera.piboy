################################################################################
#
# batocera-controller-overlays
#
################################################################################
# Version: Commits on Dec 15, 2023
BATOCERA_CONTROLLER_OVERLAYS_VERSION = f86515d9b7679eb9b6b5b6d550a43e05836f59c0
BATOCERA_CONTROLLER_OVERLAYS_SITE = $(call github,hancock33,batocera-controller-overlays,$(BATOCERA_CONTROLLER_OVERLAYS_VERSION))

define BATOCERA_CONTROLLER_OVERLAYS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/batocera/controller-overlays/
	cp -f $(@D)/solid/*.png $(TARGET_DIR)/usr/share/batocera/controller-overlays/
endef

$(eval $(generic-package))
