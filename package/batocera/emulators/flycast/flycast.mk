################################################################################
#
# flycast
#
################################################################################
# Version: Commits on Apr 12, 2025
FLYCAST_VERSION = 25a882341d5ebbf8124ddd2a7421592678dfac2e
FLYCAST_SITE = https://github.com/flyinghead/flycast.git
FLYCAST_SITE_METHOD=git
FLYCAST_GIT_SUBMODULES=YES
FLYCAST_LICENSE = GPLv2
FLYCAST_DEPENDENCIES = libao libcurl libminiupnpc libpng libzip sdl2
FLYCAST_SUPPORTS_IN_SOURCE_BUILD = NO

FLYCAST_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
FLYCAST_CONF_OPTS += -DUSE_BREAKPAD=OFF
FLYCAST_CONF_OPTS += -DUSE_HOST_SDL=ON

# Get version details
FLYCAST_GIT_TAG = $(shell git -C $(FLYCAST_DL_DIR)/git describe --tags --always | tr -d '\n')
FLYCAST_GIT_HASH = $(shell git -C $(FLYCAST_DL_DIR)/git rev-parse --short HEAD | tr -d '\n')
FLYCAST_CONF_OPTS += -DGIT_VERSION=$(FLYCAST_GIT_TAG)
FLYCAST_CONF_OPTS += -DGIT_HASH=$(FLYCAST_GIT_HASH)

ifeq ($(BR2_PACKAGE_BATOCERA_GLES3),y)
    FLYCAST_CONF_OPTS += -DUSE_GLES=ON -DUSE_GLES2=OFF -DUSE_OPENGL=ON
else ifeq ($(BR2_PACKAGE_BATOCERA_GLES2),y)
    FLYCAST_CONF_OPTS += -DUSE_GLES2=ON -DUSE_GLES=OFF -DUSE_OPENGL=ON
endif

ifeq ($(BR2_PACKAGE_BATOCERA_VULKAN),)
    FLYCAST_CONF_OPTS += -DUSE_VULKAN=OFF
endif

ifeq ($(BR2_PACKAGE_HAS_LIBMALI),y)
    FLYCAST_DEPENDENCIES += libmali
    FLYCAST_CONF_OPTS += -DUSE_MALI=ON
endif

define FLYCAST_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/buildroot-build/flycast $(TARGET_DIR)/usr/bin/flycast
endef

$(eval $(cmake-package))
