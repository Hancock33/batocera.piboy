################################################################################
#
# bermuda
#
################################################################################
# Version: Commits on Dec 29, 2019
BERMUDA_VERSION = cf6bdb68d53a1618967da565a44c931b15daf791
BERMUDA_SITE = $(call github,cyxx,bermuda,$(BERMUDA_VERSION))

BERMUDA_DEPENDENCIES = sdl2 sdl2_mixer
BERMUDA_LICENSE = GPLv2

define BERMUDA_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/bs -D $(TARGET_DIR)/usr/bin/bermuda

	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/bermuda/bermuda.keys $(TARGET_DIR)/usr/share/evmapy/bermuda.keys
endef

$(eval $(cmake-package))
