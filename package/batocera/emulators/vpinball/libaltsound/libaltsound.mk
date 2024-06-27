################################################################################
#
# libaltsound
#
################################################################################
# Version: Commits on Jun 27, 2024
LIBALTSOUND_VERSION = fb87d6d34335fdb36b5ff861e5a7ba91e8f46c5b
LIBALTSOUND_SITE = $(call github,vpinball,libaltsound,$(LIBALTSOUND_VERSION))
LIBALTSOUND_LICENSE = BSD-3-Clause
LIBALTSOUND_LICENSE_FILES = LICENSE
LIBALTSOUND_DEPENDENCIES = host-libcurl
LIBALTSOUND_SUPPORTS_IN_SOURCE_BUILD = NO
LIBALTSOUND_INSTALL_STAGING = YES
LIBALTSOUND_EXTRA_DOWNLOADS = https://www.un4seen.com/files/bass24-linux.zip

LIBALTSOUND_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)

define LIBALTSOUND_BASS_HACKS
	rm -rf $(@D)/tmp && mkdir												$(@D)/tmp
	$(UNZIP) -o $(LIBALTSOUND_DL_DIR)/bass24-linux.zip -d					$(@D)/tmp
	cp $(@D)/tmp/bass.h														$(@D)/third-party/include
	cp $(@D)/tmp/libs/$(VPINBALL_COMMON_BASS)/libbass.so					$(@D)/third-party/runtime-libs/linux/$(VPINBALL_COMMON_ARCH)
	$(INSTALL) -D -m 0755 $(@D)/tmp/libs/$(VPINBALL_COMMON_BASS)/libbass.so $(STAGING_DIR)/usr/lib
	$(INSTALL) -D -m 0755 $(@D)/tmp/libs/$(VPINBALL_COMMON_BASS)/libbass.so $(TARGET_DIR)/usr/lib
endef

LIBALTSOUND_PRE_CONFIGURE_HOOKS += LIBALTSOUND_BASS_HACKS
LIBALTSOUND_POST_INSTALL_TARGET_HOOKS += LIBALTSOUND_BASS_HACKS

$(eval $(cmake-package))
