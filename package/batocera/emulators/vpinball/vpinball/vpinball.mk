################################################################################
#
# vpinball
#
################################################################################
# Version: Commits on Apr 04, 2024 (branch@standalone)
VPINBALL_VERSION = c206e1214716b20c3fbe98073ed7b2ede8e58376
VPINBALL_SITE = $(call github,vpinball,vpinball,$(VPINBALL_VERSION))
VPINBALL_LICENSE = GPLv3+
VPINBALL_LICENSE_FILES = LICENSE
VPINBALL_DEPENDENCIES = host-libcurl libfreeimage libpinmame libaltsound libserialport libzedmd libserum libdmdutil libdof sdl2 sdl2_image sdl2_ttf
VPINBALL_SUPPORTS_IN_SOURCE_BUILD = NO

VPINBALL_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)
VPINBALL_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
# dont use clang + mold to compile
VPINBALL_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=""
VPINBALL_CONF_OPTS += -DCMAKE_C_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-gcc
VPINBALL_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-g++

define VPINBALL_CMAKE_HACKS
	cp $(@D)/standalone/cmake/$(VPINBALL_COMMON_CMAKE) $(@D)/CMakeLists.txt
	sed -i -e s+"libSDL2_ttf-2.0.so"+"libSDL2_ttf-2.0.so.0"+ $(@D)/CMakeLists.txt
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
endef

define VPINBALL_EVMAPY
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/vpinball/vpinball/vpinball.keys $(TARGET_DIR)/usr/share/evmapy
endef

VPINBALL_PRE_CONFIGURE_HOOKS += VPINBALL_CMAKE_HACKS
VPINBALL_POST_INSTALL_TARGET_HOOKS += VPINBALL_EVMAPY

$(eval $(cmake-package))
