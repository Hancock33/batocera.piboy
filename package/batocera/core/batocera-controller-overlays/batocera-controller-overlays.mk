################################################################################
#
# batocera-controller-overlays
#
################################################################################
# Version: Commits on Oct 02, 2022
BATOCERA_CONTROLLER_OVERLAYS_VERSION = 74c1ea72083fbbd336481a9be75a0919e9ec6b1c
BATOCERA_CONTROLLER_OVERLAYS_SITE = $(call github,hancock33,batocera-controller-overlays,$(BATOCERA_CONTROLLER_OVERLAYS_VERSION))

define BATOCERA_CONTROLLER_OVERLAYS_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/usr/share/batocera/controller-overlays/
    cp -f $(@D)/solid/*.png $(TARGET_DIR)/usr/share/batocera/controller-overlays/
endef

$(eval $(generic-package))
