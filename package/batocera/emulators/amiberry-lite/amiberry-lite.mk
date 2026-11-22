################################################################################
#
# amiberry-lite
#
################################################################################
# Version: Commits on Oct 27, 2026
AMIBERRY_LITE_VERSION = v5.9.6
AMIBERRY_LITE_SITE = $(call github,BlitterStudio,amiberry-lite,$(AMIBERRY_LITE_VERSION))
AMIBERRY_LITE_LICENSE = GPL-3.0
AMIBERRY_LITE_SUPPORTS_IN_SOURCE_BUILD = NO

AMIBERRY_LITE_DEPENDENCIES += flac libpcap libmpeg2 libpng libserialport libxml2 mpg123
AMIBERRY_LITE_DEPENDENCIES += libportmidi sdl2 sdl2_image sdl2_ttf zlib
AMIBERRY_LITE_EMULATOR_INFO = amiberry.emulator.yml

AMIBERRY_LITE_CONF_OPTS += -DWITH_LTO=ON

define AMIBERRY_LITE_INSTALL_TARGET_CMDS
	# install binary
	$(INSTALL) -m 0755 -D $(@D)/buildroot-build/amiberry-lite $(TARGET_DIR)/usr/bin/amiberry

	# Copy AROS (open source alternative BIOS)
	$(INSTALL) -m 0644 -D -t $(TARGET_DIR)/usr/share/batocera/datainit/bios/amiga \
		$(@D)/buildroot-build/roms/aros-ext.bin \
		$(@D)/buildroot-build/roms/aros-rom.bin

	# Copy data and whdboot folders
	mkdir -p $(TARGET_DIR)/usr/share/amiberry
	cp -pr $(@D)/buildroot-build/whdboot $(TARGET_DIR)/usr/share/amiberry/
	cp -pr $(@D)/buildroot-build/data $(TARGET_DIR)/usr/share/amiberry/
endef

define AMIBERRY_LITE_EVMAP
	$(INSTALL) -m 0644 -D -t $(TARGET_DIR)/usr/share/evmapy $(AMIBERRY_LITE_PKGDIR)/controllers/*.amiberry.keys
endef

AMIBERRY_LITE_POST_INSTALL_TARGET_HOOKS = AMIBERRY_LITE_EVMAP

$(eval $(cmake-package))
$(eval $(emulator-info-package))
