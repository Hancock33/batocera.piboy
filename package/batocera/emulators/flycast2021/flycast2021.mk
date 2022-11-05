################################################################################
#
# flycast2021
#
################################################################################
# Version: Commits on Apr 09, 2022
FLYCAST2021_VERSION = v1.3
FLYCAST2021_SITE = https://github.com/flyinghead/flycast.git
FLYCAST2021_SITE_METHOD=git
FLYCAST2021_GIT_SUBMODULES=YES
FLYCAST2021_LICENSE = GPLv2
FLYCAST2021_DEPENDENCIES = sdl2 libpng libzip libao pulseaudio-utils

FLYCAST2021_CONF_OPTS += -DLIBRETRO=OFF
FLYCAST2021_CONF_OPTS += -DGIT_VERSION="$(shell echo $(FLYCAST2021_VERSION) | cut -c 1-7)"
FLYCAST2021_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -Wno-error=array-bounds"
FLYCAST2021_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CFLAGS) -Wno-error=array-bounds"
#FLYCAST2021_CONF_OPTS += -DCMAKE_VERBOSE_MAKEFILE=ON

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64_ANY),y)
    FLYCAST2021_CONF_OPTS += -DUSE_OPENGL=ON
else ifeq ($(BR2_PACKAGE_BATOCERA_GLES3),y)
    FLYCAST2021_CONF_OPTS += -DUSE_GLES=ON -DUSE_GLES2=OFF
else ifeq ($(BR2_PACKAGE_BATOCERA_GLES2),y)
    FLYCAST2021_CONF_OPTS += -DUSE_GLES2=ON -DUSE_GLES=OFF
endif

ifeq ($(BR2_PACKAGE_BATOCERA_VULKAN),y)
    FLYCAST2021_CONF_OPTS += -DUSE_VULKAN=ON
else
    FLYCAST2021_CONF_OPTS += -DUSE_VULKAN=OFF
endif

# RPI: use the legacy Broadcom GLES libraries
ifeq ($(BR2_PACKAGE_BATOCERA_RPI_VCORE),y)
    FLYCAST2021_CONF_OPTS += -DUSE_VIDEOCORE=ON
endif

define FLYCAST2021_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/flycast $(TARGET_DIR)/usr/bin/flycast2021
endef

$(eval $(cmake-package))
