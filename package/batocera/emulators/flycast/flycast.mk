################################################################################
#
# flycast
#
################################################################################
# Version: Commits on Mar 28, 2025
FLYCAST_VERSION = 130675aae30e0dc7682c4dc666a57e5de5bc7a78
FLYCAST_SITE = https://github.com/flyinghead/flycast.git
FLYCAST_SITE_METHOD=git
FLYCAST_GIT_SUBMODULES=YES
FLYCAST_LICENSE = GPLv2
FLYCAST_DEPENDENCIES = libao libcurl libminiupnpc libpng libzip sdl2
FLYCAST_SUPPORTS_IN_SOURCE_BUILD = NO

FLYCAST_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
FLYCAST_CONF_OPTS += -DGIT_VERSION="$(shell echo $(FLYCAST_VERSION) | cut -c 1-7)"
FLYCAST_CONF_OPTS += -DLIBRETRO=OFF
FLYCAST_CONF_OPTS += -DUSE_BREAKPAD=OFF
FLYCAST_CONF_OPTS += -DUSE_DX11=OFF
FLYCAST_CONF_OPTS += -DUSE_DX9=OFF
FLYCAST_CONF_OPTS += -DUSE_HOST_SDL=ON
FLYCAST_CONF_OPTS += -DWITH_SYSTEM_ZLIB=ON

# Get version details
FLYCAST_GIT_TAG = $(shell $(GIT) -C $(FLYCAST_DL_DIR)/git describe --tags --always | tr -d '\n')
FLYCAST_GIT_HASH = $(shell $(GIT) -C $(FLYCAST_DL_DIR)/git rev-parse --short HEAD | tr -d '\n')
FLYCAST_CONF_OPTS += -DGIT_VERSION=$(FLYCAST_GIT_TAG)
FLYCAST_CONF_OPTS += -DGIT_HASH=$(FLYCAST_GIT_HASH)

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64_ANY),y)
    FLYCAST_CONF_OPTS += -DUSE_OPENGL=ON
else ifeq ($(BR2_PACKAGE_BATOCERA_GLES3),y)
    FLYCAST_CONF_OPTS += -DUSE_GLES=ON -DUSE_GLES2=OFF -DUSE_OPENGL=ON
else ifeq ($(BR2_PACKAGE_BATOCERA_GLES2),y)
    FLYCAST_CONF_OPTS += -DUSE_GLES2=ON -DUSE_GLES=OFF -DUSE_OPENGL=ON
endif

ifeq ($(BR2_PACKAGE_BATOCERA_VULKAN),y)
    FLYCAST_CONF_OPTS += -DUSE_VULKAN=ON
else
    FLYCAST_CONF_OPTS += -DUSE_VULKAN=OFF
endif

# RPI: use the legacy Broadcom GLES libraries
ifeq ($(BR2_PACKAGE_BATOCERA_RPI_VCORE),y)
    FLYCAST_CONF_OPTS += -DUSE_VIDEOCORE=ON
endif

ifeq ($(BR2_PACKAGE_HAS_LIBMALI),y)
    FLYCAST_DEPENDENCIES += libmali
    FLYCAST_CONF_OPTS += -DUSE_MALI=ON
endif

define FLYCAST_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/buildroot-build/flycast $(TARGET_DIR)/usr/bin/flycast
endef

$(eval $(cmake-package))
