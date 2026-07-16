################################################################################
#
# lightspark
#
################################################################################
# Version: Commits on Jul 15, 2026
LIGHTSPARK_VERSION = e743da7eb8981880f53946e67fd47cb6094b247e
LIGHTSPARK_SITE = $(call github,lightspark,lightspark,$(LIGHTSPARK_VERSION))
LIGHTSPARK_LICENSE = LGPLv3
LIGHTSPARK_DEPENDENCIES = cairo ffmpeg freetype jpeg libcurl libpng pango pcre2 rtmpdump sdl2
LIGHTSPARK_SUPPORTS_IN_SOURCE_BUILD = NO
LIGHTSPARK_EMULATOR_INFO = lightspark.emulator.yml

LIGHTSPARK_CONF_OPTS += -DCOMPILE_NPAPI_PLUGIN=FALSE -DCOMPILE_PPAPI_PLUGIN=FALSE

LIGHTSPARK_ARCH = $(BR2_ARCH)

ifeq ($(filter y,$(BR2_x86_64) $(BR2_PACKAGE_BATOCERA_BCM27XX)),)
    LIGHTSPARK_CONF_OPTS += -DCMAKE_C_FLAGS=-DEGL_NO_X11
    LIGHTSPARK_CONF_OPTS += -DCMAKE_CXX_FLAGS=-DEGL_NO_X11
    LIGHTSPARK_CONF_OPTS += -DENABLE_SSE2=OFF
endif

ifeq ($(LIGHTSPARK_ARCH), "arm")
    LIGHTSPARK_ARCH = armv7l
endif

ifeq ($(BR2_PACKAGE_BATOCERA_GLES3),y)
    LIGHTSPARK_CONF_OPTS += -DENABLE_GLES3=ON
    LIGHTSPARK_DEPENDENCIES += libgles
else ifeq ($(BR2_PACKAGE_BATOCERA_GLES2),y)
    LIGHTSPARK_CONF_OPTS += -DENABLE_GLES2=ON
    LIGHTSPARK_DEPENDENCIES += libgles
endif

define LIGHTSPARK_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin
	mkdir -p $(TARGET_DIR)/usr/lib
	cp -pr $(@D)/buildroot-build/$(LIGHTSPARK_ARCH)/Release/bin/lightspark $(TARGET_DIR)/usr/bin/lightspark
	cp -pr $(@D)/buildroot-build/$(LIGHTSPARK_ARCH)/Release/lib/*          $(TARGET_DIR)/usr/lib/
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
