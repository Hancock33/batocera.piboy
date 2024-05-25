################################################################################
#
# hypseus-singe
#
################################################################################
# Version: Commits on May 05, 2024
HYPSEUS_SINGE_VERSION = 1a6fcd2b4fd771e4d1f1677fb5d636eb7cbe8946
HYPSEUS_SINGE_SITE = $(call github,DirtBagXon,hypseus-singe,$(HYPSEUS_SINGE_VERSION))
HYPSEUS_SINGE_LICENSE = GPLv3
HYPSEUS_SINGE_DEPENDENCIES = libzip sdl2 sdl2_image sdl2_ttf zlib libogg libvorbis libmpeg2
HYPSEUS_SINGE_SUPPORTS_IN_SOURCE_BUILD = NO
HYPSEUS_SINGE_SUBDIR = src
HYPSEUS_SINGE_BEZELS_SOURCE = Bezels_Pack.zip
HYPSEUS_SINGE_EXTRA_DOWNLOADS = https://github.com/DirtBagXon/hypseus-singe/releases/download/v2.11.2/$(HYPSEUS_SINGE_BEZELS_SOURCE)

HYPSEUS_SINGE_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
HYPSEUS_SINGE_CONF_OPTS += -DCMAKE_C_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-gcc
HYPSEUS_SINGE_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-g++

define HYPSEUS_SINGE_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/buildroot-build/hypseus $(TARGET_DIR)/usr/bin/
		mkdir -p $(TARGET_DIR)/usr/share/hypseus-singe

	# copy support files
	cp -pr $(@D)/pics $(TARGET_DIR)/usr/share/hypseus-singe
	cp -pr $(@D)/fonts $(TARGET_DIR)/usr/share/hypseus-singe
	cp -pr $(@D)/sound $(TARGET_DIR)/usr/share/hypseus-singe
	cp -pf $(@D)/doc/*.ini $(TARGET_DIR)/usr/share/hypseus-singe

	#evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp -f $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/hypseus-singe/*.keys $(TARGET_DIR)/usr/share/evmapy
endef

define HYPSEUS_SINGE_INSTALL_BEZELS
    mkdir -p $(@D)/bezels
    cd $(@D)/bezels && unzip -x -o $(DL_DIR)/$(HYPSEUS_SINGE_DL_SUBDIR)/$(HYPSEUS_SINGE_BEZELS_SOURCE)
	mkdir -p $(TARGET_DIR)/usr/share/hypseus-singe/bezels
	cp -f $(@D)/bezels/daphne/Daphne.png $(TARGET_DIR)/usr/share/hypseus-singe/bezels
	cp -f $(@D)/bezels/daphne/v2/*.png $(TARGET_DIR)/usr/share/hypseus-singe/bezels
	cp -f $(@D)/bezels/singe/*.png $(TARGET_DIR)/usr/share/hypseus-singe/bezels
	cp -f $(@D)/bezels/singe/gungames/*.png $(TARGET_DIR)/usr/share/hypseus-singe/bezels
	cp -f $(@D)/bezels/singe/gungames/actionmax/*.png $(TARGET_DIR)/usr/share/hypseus-singe/bezels
endef

# Extract the bezels we want
#HYPSEUS_SINGE_POST_INSTALL_TARGET_HOOKS = HYPSEUS_SINGE_INSTALL_BEZELS

$(eval $(cmake-package))
