################################################################################
#
# f2bgl
#
################################################################################
# Version: Commits on Oct 18, 2020
F2BGL_VERSION = 0b84f41c7cc13a41f5a1832549485b814a52070d
F2BGL_SITE = $(call github,cyxx,f2bgl,$(F2BGL_VERSION))
F2BGL_EMULATOR_INFO = f2bgl.emulator.yml
F2BGL_DEPENDENCIES = sdl2 sdl2_mixer
F2BGL_LICENSE = GPLv2

define F2BGL_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/f2bgl -D $(TARGET_DIR)/usr/bin/f2bgl
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
