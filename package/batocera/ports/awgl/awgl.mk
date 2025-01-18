################################################################################
#
# awgl
#
################################################################################
# Version: Commits on Jun 13, 2024
AWGL_VERSION = df249583a87d5c2f73cb362f7163799e01cd0c4c
AWGL_SITE = $(call github,M-HT,rawgl,$(AWGL_VERSION))

AWGL_DEPENDENCIES = sdl2 sdl2_mixer freepats
AWGL_LICENSE = GPLv2

define AWGL_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/rawgl -D $(TARGET_DIR)/usr/bin/awgl

	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/awgl/awgl.keys $(TARGET_DIR)/usr/share/evmapy/awgl.keys
endef

$(eval $(cmake-package))
