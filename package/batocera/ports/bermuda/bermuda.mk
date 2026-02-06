################################################################################
#
# bermuda
#
################################################################################
# Version: Commits on Dec 29, 2019
BERMUDA_VERSION = cf6bdb68d53a1618967da565a44c931b15daf791
BERMUDA_SITE = $(call github,cyxx,bermuda,$(BERMUDA_VERSION))
BERMUDA_EMULATOR_INFO = bermuda.emulator.yml
BERMUDA_DEPENDENCIES = sdl2 sdl2_mixer
BERMUDA_LICENSE = GPLv2

define BERMUDA_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/bs -D $(TARGET_DIR)/usr/bin/bermuda
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
