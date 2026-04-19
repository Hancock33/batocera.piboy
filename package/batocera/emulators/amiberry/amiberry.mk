################################################################################
#
# amiberry
#
################################################################################
# Version: Commits on Apr 14, 2026
AMIBERRY_VERSION = v8.1.5
AMIBERRY_SITE = $(call github,BlitterStudio,amiberry,$(AMIBERRY_VERSION))
AMIBERRY_LICENSE = GPLv3
AMIBERRY_SUPPORTS_IN_SOURCE_BUILD = NO

AMIBERRY_DEPENDENCIES += flac libpcap libmpeg2 libpng libserialport libxml2 mpg123
AMIBERRY_DEPENDENCIES += portmidi sdl3 sdl3_image sdl3_ttf zlib
AMIBERRY_EMULATOR_INFO = amiberry.emulator.yml

AMIBERRY_CONF_OPTS += -DCMAKE_C_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-gcc
AMIBERRY_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-g++
AMIBERRY_CONF_OPTS += -DWITH_LTO=ON

ifeq ($(BR2_PACKAGE_LIBGLEW)$(BR2_PACKAGE_LIBGLU),yy)
AMIBERRY_DEPENDENCIES += libglew libglu
AMIBERRY_CONF_OPTS += -DUSE_OPENGL=ON
else
AMIBERRY_CONF_OPTS += -DUSE_OPENGL=OFF
endif

define AMIBERRY_INSTALL_TARGET_CMDS
	# install binary
	$(INSTALL) -D $(@D)/buildroot-build/amiberry $(TARGET_DIR)/usr/bin/amiberry

	# Copy AROS (open source alternative BIOS)
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/bios/amiga
	cp -prn $(@D)/buildroot-build/roms/aros-ext.bin $(TARGET_DIR)/usr/share/batocera/datainit/bios/amiga/
	cp -prn $(@D)/buildroot-build/roms/aros-rom.bin $(TARGET_DIR)/usr/share/batocera/datainit/bios/amiga/

	# Copy data and whdboot folders
	mkdir -p $(TARGET_DIR)/usr/share/amiberry
	cp -pr $(@D)/buildroot-build/whdboot $(TARGET_DIR)/usr/share/amiberry/
	cp -pr $(@D)/buildroot-build/data $(TARGET_DIR)/usr/share/amiberry/
endef

define AMIBERRY_EVMAP
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp -pvr $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/amiberry/controllers/*.amiberry.keys $(TARGET_DIR)/usr/share/evmapy
endef

AMIBERRY_POST_INSTALL_TARGET_HOOKS = AMIBERRY_EVMAP

$(eval $(cmake-package))
$(eval $(emulator-info-package))
