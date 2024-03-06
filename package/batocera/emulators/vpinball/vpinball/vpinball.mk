################################################################################
#
# vpinball
#
################################################################################
# Version: Commits on Mar 06, 2024 (branch@standalone)
VPINBALL_VERSION = e4bb2523eec342adb80ec0e11c3204620de7d380
VPINBALL_SITE = $(call github,vpinball,vpinball,$(VPINBALL_VERSION))
VPINBALL_LICENSE = GPLv3+
VPINBALL_LICENSE_FILES = LICENSE
VPINBALL_DEPENDENCIES = host-libcurl libfreeimage libpinmame libaltsound libserialport libzedmd libserum libdmdutil sdl2 sdl2_image sdl2_ttf
VPINBALL_SUPPORTS_IN_SOURCE_BUILD = NO
VPINBALL_EXTRA_DOWNLOADS = https://www.un4seen.com/files/bass24-linux.zip

# handle supported target platforms
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RK3588),y)
	SOURCE = CMakeLists_gl-linux-aarch64.txt
	SOURCE_DIR = linux-aarch64
	ARCH = aarch64
	VPINBALL_CONF_OPTS += "-DBUILD_RK3588=ON"
endif

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711)$(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
	SOURCE = CMakeLists_gl-linux-aarch64.txt
	SOURCE_DIR = linux-aarch64
	ARCH = aarch64
	VPINBALL_CONF_OPTS += "-DBUILD_RPI=ON"
endif

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64_ANY),y)
	SOURCE = CMakeLists_gl-linux-x64.txt
	SOURCE_DIR = linux-x64
	ARCH = x86_64
endif

define VPINBALL_CMAKE_HACKS
	## derived from standalone/linux/external.sh ##
	# copy linux x64
	cp $(@D)/standalone/cmake/$(SOURCE) $(@D)/CMakeLists.txt
	sed -i -e s+" 3.26"+" 3.22"+ $(@D)/CMakeLists.txt
	sed -i -e s+"libSDL2_ttf-2.0.so"+"libSDL2_ttf-2.0.so.0"+ $(@D)/CMakeLists.txt
	$(SED) 's:$${CMAKE_SOURCE_DIR}/standalone/$(SOURCE_DIR)/external/include:$(STAGING_DIR)/usr/include/:g' $(@D)/CMakeLists.txt
	$(SED) 's:$${CMAKE_SOURCE_DIR}/standalone/$(SOURCE_DIR)/external/lib/:$(STAGING_DIR)/usr/lib/:g' $(@D)/CMakeLists.txt
	# bass24 - this is ugly...
	rm -rf $(@D)/tmp && mkdir $(@D)/tmp
	$(UNZIP) -o $(VPINBALL_DL_DIR)/bass24-linux.zip -d $(@D)/tmp
	$(INSTALL) -D -m 0755 $(@D)/tmp/libs/$(ARCH)/libbass.so $(STAGING_DIR)/usr/lib
	$(INSTALL) -D -m 0755 $(@D)/tmp/libs/$(ARCH)/libbass.so $(TARGET_DIR)/usr/lib
endef

VPINBALL_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=""
VPINBALL_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
VPINBALL_CONF_OPTS += -DPOST_BUILD_COPY_EXT_LIBS=OFF
VPINBALL_CONF_OPTS += -DCMAKE_C_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-gcc
VPINBALL_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-g++

define VPINBALL_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin/vpinball
	# install binary
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/VPinballX_GL \
		$(TARGET_DIR)/usr/bin/vpinball
	# copy folders
	cp -R $(@D)/buildroot-build/flexdmd			$(TARGET_DIR)/usr/bin/vpinball/
	cp -R $(@D)/buildroot-build/assets			$(TARGET_DIR)/usr/bin/vpinball/
	cp -R $(@D)/buildroot-build/scripts			$(TARGET_DIR)/usr/bin/vpinball/
	cp -R $(@D)/buildroot-build/shader10.8.0	$(TARGET_DIR)/usr/bin/vpinball/
endef

define VPINBALL_EVMAPY
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/vpinball/vpinball/vpinball.keys \
		$(TARGET_DIR)/usr/share/evmapy
endef

VPINBALL_PRE_CONFIGURE_HOOKS += VPINBALL_CMAKE_HACKS

VPINBALL_POST_INSTALL_TARGET_HOOKS += VPINBALL_EVMAPY

$(eval $(cmake-package))
