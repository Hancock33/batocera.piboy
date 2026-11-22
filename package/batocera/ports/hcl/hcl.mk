################################################################################
#
# hcl
#
################################################################################
# Version: Commits on Dec 18, 2025
HCL_VERSION = v0.1.0
HCL_SITE = $(call github,ptitSeb,hydracastlelabyrinth,$(HCL_VERSION))
HCL_DEPENDENCIES = sdl2 sdl2_mixer
HCL_LICENSE = GPL-2.0
HCL_EMULATOR_INFO = hcl.emulator.yml
HCL_SUPPORTS_IN_SOURCE_BUILD = NO

HCL_CONF_OPTS += -DUSE_SDL2=ON

define HCL_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/hcl
	cp -pvr $(@D)/data $(TARGET_DIR)/usr/share/hcl/
	$(INSTALL) -m 0754 -D $(@D)/buildroot-build/hcl $(TARGET_DIR)/usr/bin/hcl
	# install media
	mkdir -p $(TARGET_DIR)/usr/share/emulationstation/ports/hcl
	cp -a  $(HCL_PKGDIR)/media/* $(TARGET_DIR)/usr/share/emulationstation/ports/hcl/
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
