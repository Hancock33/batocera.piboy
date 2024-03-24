################################################################################
#
# daphne
#
################################################################################
# Version: Commits on Feb 02, 2024
DAPHNE_VERSION = 428d4123b4b949ea4b58d9e5c7e6cf5ec8548c91
DAPHNE_SITE = https://github.com/DirtBagXon/hypseus-singe
DAPHNE_SITE_METHOD=git
DAPHNE_LICENSE = GPLv3
DAPHNE_DEPENDENCIES = sdl2 sdl2_image sdl2_ttf zlib libogg libvorbis libmpeg2
DAPHNE_SUPPORTS_IN_SOURCE_BUILD = NO
DAPHNE_SUBDIR = src
DAPHNE_BEZELS_SOURCE = Bezels_Pack.zip
DAPHNE_EXTRA_DOWNLOADS = $(DAPHNE_SITE)/releases/download/v2.11.1/$(DAPHNE_BEZELS_SOURCE)

DAPHNE_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
DAPHNE_CONF_OPTS += -DCMAKE_C_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-gcc
DAPHNE_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-g++

define DAPHNE_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/buildroot-build/hypseus $(TARGET_DIR)/usr/bin/
		mkdir -p $(TARGET_DIR)/usr/share/daphne

	# copy support files
	cp -pr $(@D)/pics $(TARGET_DIR)/usr/share/daphne
	cp -pr $(@D)/fonts $(TARGET_DIR)/usr/share/daphne
	cp -pr $(@D)/sound $(TARGET_DIR)/usr/share/daphne
	cp -pf $(@D)/doc/*.ini $(TARGET_DIR)/usr/share/daphne

	#evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp -prn $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/daphne/daphne.daphne.keys \
		$(TARGET_DIR)/usr/share/evmapy
endef

define DAPHNE_INSTALL_BEZELS
	mkdir -p $(@D)/bezels
	cd $(@D)/bezels && unzip -x -o $(DL_DIR)/$(DAPHNE_DL_SUBDIR)/$(DAPHNE_BEZELS_SOURCE)
	mkdir -p $(TARGET_DIR)/usr/share/daphne/bezels
	cp -f $(@D)/bezels/daphne/Daphne.png $(TARGET_DIR)/usr/share/daphne/bezels
	cp -f $(@D)/bezels/daphne/v2/*.png $(TARGET_DIR)/usr/share/daphne/bezels
	cp -f $(@D)/bezels/singe/*.png $(TARGET_DIR)/usr/share/daphne/bezels
	cp -f $(@D)/bezels/singe/gungames/*.png $(TARGET_DIR)/usr/share/daphne/bezels
	cp -f $(@D)/bezels/singe/gungames/actionmax/*.png $(TARGET_DIR)/usr/share/daphne/bezels
	# Sinden
	mkdir -p $(TARGET_DIR)/usr/share/daphne/bezels/sinden
	cp -f $(@D)/bezels/singe/sinden/actionmax/*.png $(TARGET_DIR)/usr/share/daphne/bezels/sinden
	cp -f $(@D)/bezels/singe/sinden/original/*.png $(TARGET_DIR)/usr/share/daphne/bezels/sinden
	cp -f $(@D)/bezels/singe/sinden/shaded/*.png $(TARGET_DIR)/usr/share/daphne/bezels/sinden
endef

# Extract the bezels we want
DAPHNE_POST_INSTALL_TARGET_HOOKS = DAPHNE_INSTALL_BEZELS

$(eval $(cmake-package))
