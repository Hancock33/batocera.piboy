################################################################################
#
# vpinball-next
#
################################################################################
# Version: Commits on Feb 19, 2026
VPINBALL_NEXT_VERSION = 941c7df95bac2ca723adc7e3979fd31e5937ce1e
VPINBALL_SITE = $(call github,vpinball,vpinball,$(VPINBALL_VERSION))
VPINBALL_LICENSE = GPLv3+
VPINBALL_LICENSE_FILES = LICENSE
VPINBALL_DEPENDENCIES = ffmpeg libfreeimage libpinmame libaltsound libserialport libzedmd libserum libdmdutil libdof  sdl3 sdl3_image sdl3_ttf
VPINBALL_DEPENDENCIES += host-cmake
VPINBALL_SUPPORTS_IN_SOURCE_BUILD = NO

VPINBALL_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)
VPINBALL_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF

define VPINBALL_CMAKE_HACKS
	# cp correct cmake file to builddir
	cp $(@D)/make/$(VPINBALL_COMMON_CMAKE) $(@D)/CMakeLists.txt
	# update plugin CMakeLists - add staging paths
	for f in $(@D)/make/CMakeLists_plugin_*.txt; do \
		$(SED) 's:$${CMAKE_SOURCE_DIR}/third-party/include:$(STAGING_DIR)/usr/include\n	  $${CMAKE_SOURCE_DIR}/third-party/include:g' $$f; \
		$(SED) 's:$${CMAKE_SOURCE_DIR}/third-party/runtime-libs/$${PluginPlatform}-$${PluginArch}:$(STAGING_DIR)/usr/lib\n	  $${CMAKE_SOURCE_DIR}/third-party/runtime-libs/$${PluginPlatform}-$${PluginArch}:g' $$f; \
	done
endef

define VPINBALL_INSTALL_TARGET_CMDS
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

VPINBALL_PRE_CONFIGURE_HOOKS += VPINBALL_CMAKE_HACKS

$(eval $(cmake-package))
