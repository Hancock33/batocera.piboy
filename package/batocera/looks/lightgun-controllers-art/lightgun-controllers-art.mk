################################################################################
#
# lightgun-controllers-art
#
################################################################################
# Version: Commits on Feb 16, 2026
LIGHTGUN_CONTROLLERS_ART_VERSION = 04dd1e9554ac45ce3e2afadc32d9bc2cb1203233
LIGHTGUN_CONTROLLERS_ART_SITE = $(call github,batocera-linux,lightgun-controllers-art,$(LIGHTGUN_CONTROLLERS_ART_VERSION))
#LIGHTGUN_CONTROLLERS_ART_LICENSE =
#LIGHTGUN_CONTROLLERS_ART_LICENSE_FILES = LICENSE

define LIGHTGUN_CONTROLLERS_ART_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0644 -t $(TARGET_DIR)/usr/share/batocera/guns-overlays $(@D)/png/*.png $(@D)/infos/*.infos
	# GunCon3 has a different name on batocera
	ln -sf "GunCon3-Gun.png" "$(TARGET_DIR)/usr/share/batocera/guns-overlays/GunCon3-Gun calibrated.png"
	ln -sf "GunCon3-Gun.infos" "$(TARGET_DIR)/usr/share/batocera/guns-overlays/GunCon3-Gun calibrated.infos"
endef

$(eval $(generic-package))
