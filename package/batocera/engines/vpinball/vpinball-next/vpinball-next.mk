################################################################################
#
# vpinball
#
################################################################################
# Version: Commits on Jan 30, 2026
VPINBALL_VERSION = b6ce3b4dca05ffda13da3f22654f95950a411a44
VPINBALL_SITE = $(call github,vpinball,vpinball,$(VPINBALL_VERSION))
VPINBALL_LICENSE = GPLv3+
VPINBALL_LICENSE_FILES = LICENSE
VPINBALL_DEPENDENCIES = bgfx ffmpeg libfreeimage libpinmame libaltsound libserialport libzedmd libserum libdmdutil libdof  sdl3 sdl3_image sdl3_ttf
VPINBALL_DEPENDENCIES += host-cmake
VPINBALL_SUPPORTS_IN_SOURCE_BUILD = NO

VPINBALL_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)
VPINBALL_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF

define VPINBALL_CMAKE_HACKS
	# cp correct cmake file to builddir
	cp $(@D)/make/CMakeLists_bgfx-linux-$(VPINBALL_COMMON_ARCH).txt $(@D)/CMakeLists.txt
	# add staging paths for system libs (keep third-party for local bgfx)
	$(SED) 's:$${CMAKE_SOURCE_DIR}/third-party/include:$(STAGING_DIR)/usr/include\n   $${CMAKE_SOURCE_DIR}/third-party/include:g' $(@D)/CMakeLists.txt
	$(SED) 's:$${CMAKE_SOURCE_DIR}/third-party/runtime-libs/$(SOURCE_DIR):$(STAGING_DIR)/usr/lib\n   $${CMAKE_SOURCE_DIR}/third-party/runtime-libs/$(SOURCE_DIR):g' $(@D)/CMakeLists.txt
	# update plugin CMakeLists - add staging paths
	for f in $(@D)/make/CMakeLists_plugin_*.txt; do \
		$(SED) 's:$${CMAKE_SOURCE_DIR}/third-party/include:$(STAGING_DIR)/usr/include\n	  $${CMAKE_SOURCE_DIR}/third-party/include:g' $$f; \
		$(SED) 's:$${CMAKE_SOURCE_DIR}/third-party/runtime-libs/$${PluginPlatform}-$${PluginArch}:$(STAGING_DIR)/usr/lib\n	  $${CMAKE_SOURCE_DIR}/third-party/runtime-libs/$${PluginPlatform}-$${PluginArch}:g' $$f; \
	done
endef

define VPINBALL_INSTALL_TARGET_CMDS
	rm -rf   $(TARGET_DIR)/usr/bin/vpinball
	mkdir -p $(TARGET_DIR)/usr/bin/vpinball
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/VPinballX_BGFX $(TARGET_DIR)/usr/bin/vpinball/VPinballX_GL
	cp -R $(@D)/buildroot-build/plugins $(TARGET_DIR)/usr/bin/vpinball/
	cp -R $(@D)/buildroot-build/assets  $(TARGET_DIR)/usr/bin/vpinball/
	cp -R $(@D)/buildroot-build/scripts $(TARGET_DIR)/usr/bin/vpinball/
	$(INSTALL) -D -m 0755 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/engines/vpinball/vpinball/batocera-vpx-scraper.py $(TARGET_DIR)/usr/bin/batocera-vpx-scraper
	#evmapy install
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/engines/vpinball/vpinball/vpinball.keys $(TARGET_DIR)/usr/share/evmapy
endef

VPINBALL_PRE_CONFIGURE_HOOKS += VPINBALL_CMAKE_HACKS

$(eval $(cmake-package))
