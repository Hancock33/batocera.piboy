################################################################################
#
# lightspark
#
################################################################################
# Version: Commits on Nov 18, 2026
LIGHTSPARK_VERSION = 670eaebeffd5436c08b0c4e693ab7f36fb4befed
LIGHTSPARK_SITE = $(call github,lightspark,lightspark,$(LIGHTSPARK_VERSION))
LIGHTSPARK_LICENSE = LGPL-3.0
LIGHTSPARK_DEPENDENCIES = cairo ffmpeg freetype jpeg libcurl libpng pango pcre2 rtmpdump sdl2
LIGHTSPARK_SUPPORTS_IN_SOURCE_BUILD = NO
LIGHTSPARK_EMULATOR_INFO = lightspark.emulator.yml

LIGHTSPARK_CONF_OPTS += -DCOMPILE_NPAPI_PLUGIN=FALSE -DCOMPILE_PPAPI_PLUGIN=FALSE

ifeq ($(BR2_ARM_CPU_ARMV6),y)
LIGHTSPARK_ARCH = armv6l
else ifeq ($(BR2_arm),y)
LIGHTSPARK_ARCH = armv7l
else
LIGHTSPARK_ARCH = $(call qstrip,$(BR2_ARCH))
endif

ifneq ($(BR2_x86_64),y)
LIGHTSPARK_CONF_OPTS += -DCMAKE_C_FLAGS=-DEGL_NO_X11
LIGHTSPARK_CONF_OPTS += -DCMAKE_CXX_FLAGS=-DEGL_NO_X11
LIGHTSPARK_CONF_OPTS += -DENABLE_SSE2=OFF
endif

ifeq ($(BR2_PACKAGE_BATOCERA_GLES3),y)
LIGHTSPARK_CONF_OPTS += -DENABLE_GLES3=ON
LIGHTSPARK_DEPENDENCIES += libgles
else ifeq ($(BR2_PACKAGE_BATOCERA_GLES2),y)
LIGHTSPARK_CONF_OPTS += -DENABLE_GLES2=ON
LIGHTSPARK_DEPENDENCIES += libgles
endif
define LIGHTSPARK_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/$(LIGHTSPARK_ARCH)/Release/bin/lightspark $(TARGET_DIR)/usr/bin/lightspark
	mkdir -p $(TARGET_DIR)/usr/lib
	cp -pr $(@D)/buildroot-build/$(LIGHTSPARK_ARCH)/Release/lib/* $(TARGET_DIR)/usr/lib/
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
