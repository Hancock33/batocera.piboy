################################################################################
#
# vpinball-next
#
################################################################################
# Version: Commits on Apr 07, 2026
VPINBALL_NEXT_VERSION = 79e47cd9bc41766a60fc6a5aa7becc60d9eab919
VPINBALL_NEXT_SITE = $(call github,vpinball,vpinball,$(VPINBALL_NEXT_VERSION))
VPINBALL_NEXT_LICENSE = GPLv3+
VPINBALL_NEXT_LICENSE_FILES = LICENSE
VPINBALL_NEXT_DEPENDENCIES = ffmpeg libfreeimage libpinmame libaltsound libserialport libzedmd libserum libdmdutil libdof  sdl3 sdl3_image sdl3_ttf
VPINBALL_NEXT_DEPENDENCIES += host-cmake
VPINBALL_NEXT_SUPPORTS_IN_SOURCE_BUILD = NO

VPINBALL_NEXT_CONF_OPTS += $(VPINBALL_NEXT_COMMON_CONF_OPTS)
VPINBALL_NEXT_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF

define VPINBALL_NEXT_CMAKE_HACKS
	# cp correct cmake file to builddir
	cp $(@D)/make/$(VPINBALL_NEXT_COMMON_CMAKE) $(@D)/CMakeLists.txt
	# update plugin CMakeLists - add staging paths
	for f in $(@D)/make/CMakeLists_plugin_*.txt; do \
		$(SED) 's:$${CMAKE_SOURCE_DIR}/third-party/include:$(STAGING_DIR)/usr/include\n	  $${CMAKE_SOURCE_DIR}/third-party/include:g' $$f; \
		$(SED) 's:$${CMAKE_SOURCE_DIR}/third-party/runtime-libs/$${PluginPlatform}-$${PluginArch}:$(STAGING_DIR)/usr/lib\n	  $${CMAKE_SOURCE_DIR}/third-party/runtime-libs/$${PluginPlatform}-$${PluginArch}:g' $$f; \
	done
endef

define VPINBALL_NEXT_INSTALL_TARGET_CMDS
	rm -rf   $(TARGET_DIR)/usr/bin/vpinball
	mkdir -p $(TARGET_DIR)/usr/bin/vpinball
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/VPinballX_GL $(TARGET_DIR)/usr/bin/vpinball/VPinballX_GL
	cp -R $(@D)/buildroot-build/plugins $(TARGET_DIR)/usr/bin/vpinball/
	cp -R $(@D)/buildroot-build/assets  $(TARGET_DIR)/usr/bin/vpinball/
	cp -R $(@D)/buildroot-build/scripts $(TARGET_DIR)/usr/bin/vpinball/
	$(INSTALL) -D -m 0755 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/engines/vpinball/vpinball/batocera-vpx-scraper.py $(TARGET_DIR)/usr/bin/batocera-vpx-scraper
	#evmapy install
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/engines/vpinball/vpinball/vpinball.keys $(TARGET_DIR)/usr/share/evmapy
endef

VPINBALL_NEXT_PRE_CONFIGURE_HOOKS += VPINBALL_NEXT_CMAKE_HACKS

$(eval $(cmake-package))
