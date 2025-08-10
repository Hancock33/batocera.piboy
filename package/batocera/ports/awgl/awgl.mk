################################################################################
#
# awgl
#
################################################################################
# Version: Commits on Aug 09, 2025
AWGL_VERSION = b85411238d5a1f06f8b612ba72e4c5df145dc90d
AWGL_SITE = $(call github,M-HT,rawgl,$(AWGL_VERSION))

AWGL_DEPENDENCIES = mt32emu sdl2 sdl2_mixer
AWGL_LICENSE = GPLv2

define AWGL_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/rawgl -D $(TARGET_DIR)/usr/bin/awgl
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/awgl/awgl.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
