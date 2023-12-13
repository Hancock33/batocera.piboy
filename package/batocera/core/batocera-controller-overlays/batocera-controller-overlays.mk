################################################################################
#
# batocera-controller-overlays
#
################################################################################
# Version: Commits on Dec 13, 2023
BATOCERA_CONTROLLER_OVERLAYS_VERSION = 2321c8baa1781d61973ad8d352c07fcbf590f57e
BATOCERA_CONTROLLER_OVERLAYS_SITE = $(call github,hancock33,batocera-controller-overlays,$(BATOCERA_CONTROLLER_OVERLAYS_VERSION))

define BATOCERA_CONTROLLER_OVERLAYS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/batocera/controller-overlays/
	cp -f $(@D)/solid/*.png $(TARGET_DIR)/usr/share/batocera/controller-overlays/
endef

$(eval $(generic-package))
