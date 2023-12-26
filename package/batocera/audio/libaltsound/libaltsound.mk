################################################################################
#
# libaltsound
#
################################################################################
# Version: Commits on Dec 26, 2023
LIBALTSOUND_VERSION = 816cc987db61c428c61746b65ab30aa765c87116
LIBALTSOUND_SITE = $(call github,vpinball,libaltsound,$(LIBALTSOUND_VERSION))
LIBALTSOUND_LICENSE = GPLv3+
LIBALTSOUND_LICENSE_FILES = LICENSE
LIBALTSOUND_DEPENDENCIES = libfreeimage libpinmame libserum libzedmd sdl2 sdl2_image sdl2_ttf
LIBALTSOUND_SUPPORTS_IN_SOURCE_BUILD = NO
LIBALTSOUND_INSTALL_STAGING = YES
LIBALTSOUND_EXTRA_DOWNLOADS = https://www.un4seen.com/files/bass24-linux.zip

# handle supported target platforms
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RK3588),y)
	PKG_ARCH = aarch64
	BASS_ALT_ARCH = aarch64
endif

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711)$(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
	PKG_ARCH = aarch64
	BASS_ALT_ARCH = aarch64
endif

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64_ANY),y)
	PKG_ARCH = x64
	BASS_ALT_ARCH = x86_64
endif


LIBALTSOUND_CONF_OPTS += -DPLATFORM=linux -DPKG_ARCH=$(PKG_ARCH) -DBUILD_STATIC=OFF

define LIBALTSOUND_CMAKE_HACKS
	sed -i -e s+" 3.25"+" 3.22"+								$(@D)/CMakeLists.txt
	rm -rf $(@D)/tmp && mkdir									$(@D)/tmp
	$(UNZIP) -o $(VPINBALL_DL_DIR)/bass24-linux.zip -d			$(@D)/tmp
	cp $(@D)/tmp/bass.h											$(@D)/third-party/include
	cp $(@D)/tmp/libs/$(BASS_ALT_ARCH)/libbass.so 				$(@D)/third-party/runtime-libs/linux/$(PKG_ARCH)
	cp $(@D)/tmp/bass.h 										$(@D)/third-party/include
endef

LIBALTSOUND_PRE_CONFIGURE_HOOKS += LIBALTSOUND_CMAKE_HACKS

$(eval $(cmake-package))
