################################################################################
#
# lightspark
#
################################################################################
# Version: Commits on May 26, 2023
LIGHTSPARK_VERSION = 6328c226b05d673fe325cfc66094f1791f8d29db
LIGHTSPARK_SITE = $(call github,lightspark,lightspark,$(LIGHTSPARK_VERSION))
LIGHTSPARK_LICENSE = LGPLv3
LIGHTSPARK_DEPENDENCIES = sdl2 sdl2_mixer freetype pcre jpeg libpng cairo ffmpeg libcurl rtmpdump host-ninja

LIGHTSPARK_CONF_OPTS  = -DCMAKE_BUILD_TYPE=Release -GNinja

define LIGHTSPARK_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(LIGHTSPARK_BUILDDIR)
endef

define LIGHTSPARK_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin
	mkdir -p $(TARGET_DIR)/usr/lib
	mkdir -p $(TARGET_DIR)/usr/share/evmapy

	cp -pr $(@D)/$(BR2_ARCH)/Release/bin/lightspark $(TARGET_DIR)/usr/bin/lightspark
	cp -pr $(@D)/$(BR2_ARCH)/Release/lib/*          $(TARGET_DIR)/usr/lib/

	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/lightspark/flash.lightspark.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
