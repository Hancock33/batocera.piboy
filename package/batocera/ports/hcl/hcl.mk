################################################################################
#
# hcl
#
################################################################################
# Version: Commits on Dec 18, 2025
HCL_VERSION = 28dd246e765962de7d4df6aa1ee618e45a9a367d
HCL_SITE = $(call github,ptitSeb,hydracastlelabyrinth,$(HCL_VERSION))
HCL_DEPENDENCIES = sdl2 sdl2_mixer
HCL_LICENSE = GPL-2.0
HCL_SUPPORTS_IN_SOURCE_BUILD = NO

HCL_CONF_OPTS += -DUSE_SDL2=ON

define HCL_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/hcl
	cp -pvr $(@D)/data $(TARGET_DIR)/usr/share/hcl/
	$(INSTALL) -D $(@D)/buildroot-build/hcl $(TARGET_DIR)/usr/bin/hcl
	chmod 0754 $(TARGET_DIR)/usr/bin/hcl
	# install media
	mkdir -p $(TARGET_DIR)/usr/share/emulationstation/ports/hcl
	cp -a  $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/hcl/media/* $(TARGET_DIR)/usr/share/emulationstation/ports/hcl/
endef

$(eval $(cmake-package))
