################################################################################
#
# lightspark
#
################################################################################
# Version: Commits on Jan 12, 2025
LIGHTSPARK_VERSION = 5b847f5fe9c277678a7adc23f24ff6af00990f10
LIGHTSPARK_SITE = $(call github,lightspark,lightspark,$(LIGHTSPARK_VERSION))
LIGHTSPARK_LICENSE = LGPLv3
LIGHTSPARK_DEPENDENCIES = sdl2 freetype pcre jpeg libpng cairo pango ffmpeg libcurl rtmpdump
LIGHTSPARK_SUPPORTS_IN_SOURCE_BUILD = NO

ifeq ($(BR2_PACKAGE_XORG7)$(BR2_PACKAGE_HAS_LIBGL),yy)
LIGHTSPARK_DEPENDENCIES += libglew
endif

LIGHTSPARK_CONF_OPTS += -DCOMPILE_NPAPI_PLUGIN=FALSE -DCOMPILE_PPAPI_PLUGIN=FALSE
ifeq ($(filter y,$(BR2_x86_64) $(BR2_PACKAGE_BATOCERA_BCM27XX)),)
LIGHTSPARK_CONF_OPTS += -DENABLE_GLES2=TRUE -DCMAKE_C_FLAGS=-DEGL_NO_X11 -DCMAKE_CXX_FLAGS=-DEGL_NO_X11
endif

LIGHTSPARK_ARCH = $(BR2_ARCH)
ifeq ($(LIGHTSPARK_ARCH), "arm")
LIGHTSPARK_ARCH = armv7l
endif

define LIGHTSPARK_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin
	mkdir -p $(TARGET_DIR)/usr/lib
	mkdir -p $(TARGET_DIR)/usr/share/evmapy

	cp -pr $(@D)/buildroot-build/$(LIGHTSPARK_ARCH)/Release/bin/lightspark	$(TARGET_DIR)/usr/bin/lightspark
	cp -pr $(@D)/buildroot-build/$(LIGHTSPARK_ARCH)/Release/lib/*			$(TARGET_DIR)/usr/lib/

	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/lightspark/flash.lightspark.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
