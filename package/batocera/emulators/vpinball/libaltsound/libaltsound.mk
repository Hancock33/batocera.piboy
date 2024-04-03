################################################################################
#
# libaltsound
#
################################################################################
# Version: Commits on Feb 11, 2024
LIBALTSOUND_VERSION = 9ac08a76e2aabc1fba57d3e5a3b87e7f63c09e07
LIBALTSOUND_SITE = $(call github,vpinball,libaltsound,$(LIBALTSOUND_VERSION))
LIBALTSOUND_LICENSE = BSD-3-Clause
LIBALTSOUND_LICENSE_FILES = LICENSE
LIBALTSOUND_DEPENDENCIES = host-libcurl
LIBALTSOUND_SUPPORTS_IN_SOURCE_BUILD = NO
LIBALTSOUND_EXTRA_DOWNLOADS = https://www.un4seen.com/files/bass24-linux.zip

LIBALTSOUND_CONF_OPTS += -DPLATFORM=linux
LIBALTSOUND_CONF_OPTS += -DPOST_BUILD_COPY_EXT_LIBS=OFF

# handle supported target platforms
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RK3588),y)
	PKG_ARCH = aarch64
	BASS_ALT_ARCH = aarch64
	LIBDMDUTIL_CONF_OPTS += -DARCH=aarch64
endif

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711)$(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
	PKG_ARCH = aarch64
	BASS_ALT_ARCH = aarch64
	LIBALTSOUND_CONF_OPTS += -DARCH=aarch64
endif

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64_ANY),y)
	PKG_ARCH = x64
	BASS_ALT_ARCH = x86_64
	LIBALTSOUND_CONF_OPTS += -DARCH=x64
endif

define LIBALTSOUND_BASS_HACKS
	rm -rf $(@D)/tmp && mkdir								$(@D)/tmp
	$(UNZIP) -o $(LIBALTSOUND_DL_DIR)/bass24-linux.zip -d	$(@D)/tmp
	cp $(@D)/tmp/bass.h										$(@D)/third-party/include
	cp $(@D)/tmp/libs/$(BASS_ALT_ARCH)/libbass.so 			$(@D)/third-party/runtime-libs/linux/$(PKG_ARCH)
	$(INSTALL) -D -m 0755 $(@D)/tmp/libs/$(ARCH)/libbass.so $(STAGING_DIR)/usr/lib
	$(INSTALL) -D -m 0755 $(@D)/tmp/libs/$(ARCH)/libbass.so $(TARGET_DIR)/usr/lib
endef

# Install to staging to build Visual Pinball Standalone
LIBALTSOUND_INSTALL_STAGING = YES

LIBALTSOUND_PRE_CONFIGURE_HOOKS += LIBALTSOUND_BASS_HACKS
LIBALTSOUND_POST_INSTALL_TARGET_HOOKS += LIBALTSOUND_BASS_HACKS

$(eval $(cmake-package))
