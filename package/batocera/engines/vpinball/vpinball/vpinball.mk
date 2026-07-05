################################################################################
#
# vpinball
#
################################################################################
# Version: Commits on Jul 03, 2026
VPINBALL_VERSION = 8811b7a1ff103fce770a75cb906f5433a60cad96
VPINBALL_SITE = $(call github,vpinball,vpinball,$(VPINBALL_VERSION))
VPINBALL_LICENSE = GPLv3+
VPINBALL_LICENSE_FILES = LICENSE
VPINBALL_DEPENDENCIES = ffmpeg libaltsound libdmdutil libdof libfreeimage libpinmame libserialport libserum libwinevbs libzedmd sdl3 sdl3_image sdl3_ttf
VPINBALL_DEPENDENCIES += host-libcurl host-cmake
VPINBALL_SUPPORTS_IN_SOURCE_BUILD = NO
VPINBALL_EMULATOR_INFO = vpinball.emulator.yml

VPINBALL_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)
VPINBALL_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
VPINBALL_CONF_OPTS += -DPLATFORM=linux
VPINBALL_CONF_OPTS += -DRENDERER=GL
VPINBALL_CONF_OPTS += -DSYSTEM_LIBS_INCLUDE_DIR=$(STAGING_DIR)/usr/include
VPINBALL_CONF_OPTS += -DSYSTEM_LIBS_LIB_DIR=$(STAGING_DIR)/usr/lib
VPINBALL_CONF_OPTS += -DUSE_SYSTEM_LIBS=ON

define VPINBALL_INSTALL_TARGET_CMDS
	rm -rf   $(TARGET_DIR)/usr/bin/vpinball
	mkdir -p $(TARGET_DIR)/usr/bin/vpinball
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/VPinballX_GL $(TARGET_DIR)/usr/bin/vpinball/VPinballX_GL
	cp -R $(@D)/buildroot-build/plugins   $(TARGET_DIR)/usr/bin/vpinball/
	cp -R $(@D)/buildroot-build/assets    $(TARGET_DIR)/usr/bin/vpinball/
	cp -R $(@D)/buildroot-build/scripts   $(TARGET_DIR)/usr/bin/vpinball/
	cp -R $(@D)/buildroot-build/shaders-* $(TARGET_DIR)/usr/bin/vpinball/
	$(INSTALL) -D -m 0755 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/engines/vpinball/vpinball/batocera-vpx-scraper.py $(TARGET_DIR)/usr/bin/batocera-vpx-scraper
	#evmapy install
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/engines/vpinball/vpinball/vpinball.keys $(TARGET_DIR)/usr/share/evmapy
endef

VPINBALL_PRE_CONFIGURE_HOOKS += VPINBALL_CMAKE_HACKS

$(eval $(cmake-package))
$(eval $(emulator-info-package))
