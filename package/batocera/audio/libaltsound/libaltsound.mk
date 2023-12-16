################################################################################
#
# libaltsound
#
################################################################################
# Version: Commits on Dec 15, 2023
LIBALTSOUND_VERSION = e791d98451eadf6d33e8f2c22d4c47646b28017d
LIBALTSOUND_SITE = $(call github,jsm174,libaltsound,$(LIBALTSOUND_VERSION))
LIBALTSOUND_LICENSE = GPLv3+
LIBALTSOUND_LICENSE_FILES = LICENSE
LIBALTSOUND_DEPENDENCIES = libfreeimage libpinmame libserum libzedmd sdl2 sdl2_image sdl2_ttf
LIBALTSOUND_SUPPORTS_IN_SOURCE_BUILD = NO
LIBALTSOUND_EXTRA_DOWNLOADS = https://www.un4seen.com/files/bass24-linux.zip

# handle supported target platforms
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711)$(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
	PKG_ARCH = aarch64
endif

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64_ANY),y)
	PKG_ARCH = x64
endif

define LIBALTSOUND_CMAKE_HACKS
	cp $(@D)/platforms/linux/$(PKG_ARCH)/CMakeLists.txt			$(@D)/CMakeLists.txt
	sed -i -e s+" 3.25"+" 3.22"+								$(@D)/CMakeLists.txt
	rm -rf $(@D)/tmp && mkdir									$(@D)/tmp
	$(UNZIP) -o $(VPINBALL_DL_DIR)/bass24-linux.zip -d			$(@D)/tmp
	cp $(@D)/tmp/bass.h 										$(@D)/third-party/include
	cp $(@D)/tmp/libs/x86_64/libbass.so							$(@D)/third-party/runtime-libs/linux/x64
	cp $(@D)/tmp/libs/aarch64/libbass.so						$(@D)//third-party/runtime-libs/linux/aarch64
endef

define LIBALTSOUND_INSTALL_TARGET_CMDS
	# staging files
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/libaltsound.so	$(STAGING_DIR)/usr/lib
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/libaltsound.a	$(STAGING_DIR)/usr/lib
	$(INSTALL) -D -m 0755 $(@D)/src/altsound.h					$(STAGING_DIR)/usr/include

	# copy to target
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/libaltsound.so	$(TARGET_DIR)/usr/lib
endef

LIBALTSOUND_PRE_CONFIGURE_HOOKS += LIBALTSOUND_CMAKE_HACKS

$(eval $(cmake-package))
