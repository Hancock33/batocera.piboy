################################################################################
#
# awgl
#
################################################################################
# Version: Commits on Aug 10, 2025
AWGL_VERSION = 087860aee3ec7b85a86004378e2edc6fd5092741
AWGL_SITE = $(call github,M-HT,rawgl,$(AWGL_VERSION))
AWGL_EMULATOR_INFO = awgl.emulator.yml
AWGL_DEPENDENCIES = mt32emu sdl2 sdl2_mixer
AWGL_LICENSE = GPLv2

define AWGL_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/rawgl -D $(TARGET_DIR)/usr/bin/awgl
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/awgl/awgl.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
