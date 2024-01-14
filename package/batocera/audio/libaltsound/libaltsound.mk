################################################################################
#
# libaltsound
#
################################################################################
# Version: Commits on Jan 13, 2024
LIBALTSOUND_VERSION = cc1b66f4f8784acd028565c79ebdc335da3c6749
LIBALTSOUND_SITE = $(call github,vpinball,libaltsound,$(LIBALTSOUND_VERSION))
LIBALTSOUND_LICENSE = BSD-3-Clause
LIBALTSOUND_LICENSE_FILES = LICENSE
LIBALTSOUND_DEPENDENCIES = host-libcurl
LIBALTSOUND_SUPPORTS_IN_SOURCE_BUILD = NO
LIBALTSOUND_EXTRA_DOWNLOADS = https://www.un4seen.com/files/bass24-linux.zip

LIBALTSOUND_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
LIBALTSOUND_CONF_OPTS += -DBUILD_STATIC=OFF
LIBALTSOUND_CONF_OPTS += -DPLATFORM=linux
LIBALTSOUND_CONF_OPTS += -DARCH=$(PKG_ARCH)

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

define LIBALTSOUND_BASS_HACKS
	sed -i -e s+" 3.25"+" 3.22"+						$(@D)/CMakeLists.txt
	rm -rf $(@D)/tmp && mkdir							$(@D)/tmp
	$(UNZIP) -o $(VPINBALL_DL_DIR)/bass24-linux.zip -d	$(@D)/tmp
	cp $(@D)/tmp/bass.h									$(@D)/third-party/include
	cp $(@D)/tmp/libs/$(BASS_ALT_ARCH)/libbass.so 		$(@D)/third-party/runtime-libs/linux/$(PKG_ARCH)
	cp $(@D)/tmp/bass.h 								$(@D)/third-party/include
endef

# Install to staging to build Visual Pinball Standalone
LIBALTSOUND_INSTALL_STAGING = YES

LIBALTSOUND_PRE_CONFIGURE_HOOKS += LIBALTSOUND_BASS_HACKS

$(eval $(cmake-package))
