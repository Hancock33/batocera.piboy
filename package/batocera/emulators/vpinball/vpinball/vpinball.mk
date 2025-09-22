################################################################################
#
# vpinball
#
################################################################################
# Version: Commits on Jul 23, 2024
VPINBALL_VERSION = 585b9551163d4316ed0a8e5cbe19df469e8503ec
VPINBALL_BRANCH = standalone
VPINBALL_SITE = $(call github,vpinball,vpinball,$(VPINBALL_VERSION))
VPINBALL_LICENSE = GPLv3+
VPINBALL_LICENSE_FILES = LICENSE
VPINBALL_DEPENDENCIES = ffmpeg libfreeimage libpinmame libaltsound libserialport libzedmd libserum libdmdutil libdof sdl2 sdl2_image sdl2_ttf
VPINBALL_SUPPORTS_IN_SOURCE_BUILD = NO

VPINBALL_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)
VPINBALL_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF

define VPINBALL_CMAKE_HACKS
	cp $(@D)/standalone/cmake/$(VPINBALL_COMMON_CMAKE) $(@D)/CMakeLists.txt
	$(SED) '/--copy-dt-needed-entries/d' $(@D)/CMakeLists.txt
	$(SED) 's:$${CMAKE_SOURCE_DIR}/standalone/$(VPINBALL_COMMON_SRC)/external/include:$(STAGING_DIR)/usr/include/:g' $(@D)/CMakeLists.txt
	$(SED) 's:$${CMAKE_SOURCE_DIR}/standalone/$(VPINBALL_COMMON_SRC)/external/lib/:$(STAGING_DIR)/usr/lib/:g' $(@D)/CMakeLists.txt
endef

define VPINBALL_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin/vpinball
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/VPinballX_GL	$(TARGET_DIR)/usr/bin/vpinball
	cp -R $(@D)/buildroot-build/flexdmd			$(TARGET_DIR)/usr/bin/vpinball/
	cp -R $(@D)/buildroot-build/assets			$(TARGET_DIR)/usr/bin/vpinball/
	cp -R $(@D)/buildroot-build/scripts			$(TARGET_DIR)/usr/bin/vpinball/
	cp -R $(@D)/buildroot-build/shader10.8.0	$(TARGET_DIR)/usr/bin/vpinball/
	$(INSTALL) -D -m 0755 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/vpinball/vpinball/batocera-vpx-scraper.py $(TARGET_DIR)/usr/bin/batocera-vpx-scraper
	#evmapy install
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/vpinball/vpinball/vpinball.keys $(TARGET_DIR)/usr/share/evmapy
endef

VPINBALL_PRE_CONFIGURE_HOOKS += VPINBALL_CMAKE_HACKS

$(eval $(cmake-package))
