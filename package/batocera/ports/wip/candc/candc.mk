################################################################################
#
# candc
#
################################################################################
# Version: Commits on Jun 28, 2022
CANDC_VERSION = 1f28f43a99d48e3cb8e41f48b2438d0b7f451835
CANDC_SITE = $(call github,TheAssemblyArmada,Vanilla-Conquer,$(CANDC_VERSION))

CANDC_DEPENDENCIES = sdl2 openal
CANDC_LICENSE = GPL-2.0
CANDC_SUPPORTS_IN_SOURCE_BUILD = NO

define CANDC_INSTALL_TARGET_CMDS
    $(INSTALL) -D $(@D)/buildroot-build/vanillara $(TARGET_DIR)/usr/bin/vanillara
    $(INSTALL) -D $(@D)/buildroot-build/vanillatd $(TARGET_DIR)/usr/bin/vanillatd
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/candc/vanillara.keys $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/candc/vanillatd.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
