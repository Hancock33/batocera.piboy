################################################################################
#
# vpinball
#
################################################################################
# Version: Commits on Jan 16, 2026
VPINBALL_VERSION = ab458aea6c12a8ff883e91b6a29d69398a0ad040
VPINBALL_BRANCH = master
VPINBALL_SITE = $(call github,vpinball,vpinball,$(VPINBALL_VERSION))
VPINBALL_LICENSE = GPLv3+
VPINBALL_LICENSE_FILES = LICENSE
VPINBALL_DEPENDENCIES = ffmpeg libfreeimage libpinmame libaltsound libserialport libzedmd libserum libdmdutil libdof sdl3 sdl3_image sdl3_ttf
VPINBALL_SUPPORTS_IN_SOURCE_BUILD = NO

VPINBALL_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)
VPINBALL_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF

define VPINBALL_CMAKE_HACKS
	cp $(@D)/make/$(VPINBALL_COMMON_CMAKE) $(@D)/CMakeLists.txt
endef

define VPINBALL_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin/vpinball
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/VPinballX_GL	$(TARGET_DIR)/usr/bin/vpinball
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/libglad.so		$(TARGET_DIR)/usr/bin/vpinball
	cp -R $(@D)/buildroot-build/assets			$(TARGET_DIR)/usr/bin/vpinball/
	cp -R $(@D)/buildroot-build/plugins			$(TARGET_DIR)/usr/bin/vpinball/
	cp -R $(@D)/buildroot-build/scripts			$(TARGET_DIR)/usr/bin/vpinball/
	cp -R $(@D)/buildroot-build/shaders-10.8.1	$(TARGET_DIR)/usr/bin/vpinball/
	$(INSTALL) -D -m 0755 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/engines/vpinball/vpinball/batocera-vpx-scraper.py $(TARGET_DIR)/usr/bin/batocera-vpx-scraper
	#evmapy install
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/engines/vpinball/vpinball/vpinball.keys $(TARGET_DIR)/usr/share/evmapy
endef

VPINBALL_PRE_CONFIGURE_HOOKS += VPINBALL_CMAKE_HACKS

$(eval $(cmake-package))
