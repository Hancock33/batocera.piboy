################################################################################
#
# batocera-controller-overlays
#
################################################################################
# Version: Commits on Feb 12, 2026
BATOCERA_CONTROLLER_OVERLAYS_VERSION = 448f87fc0ec9825df13c1e0d4721b741aa5c32aa
BATOCERA_CONTROLLER_OVERLAYS_SITE = $(call github,hancock33,batocera-controller-overlays,$(BATOCERA_CONTROLLER_OVERLAYS_VERSION))

define BATOCERA_CONTROLLER_OVERLAYS_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0644 -t $(TARGET_DIR)/usr/share/batocera/controller-overlays $(@D)/solid/*.png
endef

$(eval $(generic-package))
