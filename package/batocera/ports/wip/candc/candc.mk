################################################################################
#
# candc
#
################################################################################
# Version: Commits on Aug 05, 2022
CANDC_VERSION = 6008d34bedc5f4fd445ad1a078c5fb1fa6cee3d2
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
