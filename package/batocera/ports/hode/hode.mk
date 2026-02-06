################################################################################
#
# hode
#
################################################################################
# Version: Commits on Dec 08, 2023
HODE_VERSION = 59f3c466923c6b8d49e29176ff697a91165e7efc
HODE_SITE = $(call github,usineur,hode,$(HODE_VERSION))
HODE_EMULATOR_INFO = hode.emulator.yml
HODE_DEPENDENCIES = sdl2 sdl2_mixer
HODE_LICENSE = GPLv2

define HODE_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/hode -D $(TARGET_DIR)/usr/bin/hode
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
