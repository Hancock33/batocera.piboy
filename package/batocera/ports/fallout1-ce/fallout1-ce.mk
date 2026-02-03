################################################################################
#
# fallout1-ce
#
################################################################################
# Version: Commits on Jan 15, 2025
FALLOUT1_CE_VERSION = 0609bcfd0ec40ff0571d0f57fab2821eb461dc8b
FALLOUT1_CE_SITE = $(call github,alexbatalov,fallout1-ce,$(FALLOUT1_CE_VERSION))
FALLOUT1_CE_DEPENDENCIES = sdl2
FALLOUT1_CE_EMULATOR_INFO = fallout1-ce.emulator.yml
FALLOUT1_CE_SUPPORTS_IN_SOURCE_BUILD = yes

define FALLOUT1_CE_INSTALL_TARGET_CMDS
	cp $(@D)/buildroot-build/fallout-ce $(TARGET_DIR)/usr/bin/fallout1-ce
	cp $(@D)/buildroot-build/_deps/adecode-build/libadecode-static.so $(TARGET_DIR)/usr/lib
	cp $(@D)/buildroot-build/_deps/fpattern-build/libfpattern-static.so $(TARGET_DIR)/usr/lib
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))