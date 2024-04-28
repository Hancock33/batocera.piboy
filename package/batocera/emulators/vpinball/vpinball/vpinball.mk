################################################################################
#
# vpinball
#
################################################################################
# Version: Commits on Apr 28, 2024 (branch@standalone)
VPINBALL_VERSION = f0facd757a2f9872f817f2e25c7060301fab2c5e
VPINBALL_SITE = $(call github,vpinball,vpinball,$(VPINBALL_VERSION))
VPINBALL_LICENSE = GPLv3+
VPINBALL_LICENSE_FILES = LICENSE
VPINBALL_DEPENDENCIES = ffmpeg host-libcurl libfreeimage libpinmame libaltsound libserialport libzedmd libserum libdmdutil libdof sdl2 sdl2_image sdl2_ttf
VPINBALL_SUPPORTS_IN_SOURCE_BUILD = NO

VPINBALL_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)
VPINBALL_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
# dont use clang to compile
VPINBALL_CONF_OPTS += -DCMAKE_C_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-gcc
VPINBALL_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-g++

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
	#evmapy install
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/vpinball/vpinball/vpinball.keys $(TARGET_DIR)/usr/share/evmapy
endef

VPINBALL_PRE_CONFIGURE_HOOKS += VPINBALL_CMAKE_HACKS

$(eval $(cmake-package))
