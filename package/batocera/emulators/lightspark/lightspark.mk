################################################################################
#
# lightspark
#
################################################################################
# Version: Commits on Dec 24, 2024
LIGHTSPARK_VERSION = 1e39767f2b5f3a65ef174b822637727c82176d76
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
