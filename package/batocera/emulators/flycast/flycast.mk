################################################################################
#
# flycast
#
################################################################################
# Version: Commits on Nov 21, 2026
FLYCAST_VERSION = 027b1054a457008ed5317732f456f9fbbb400df4
FLYCAST_SITE = https://github.com/flyinghead/flycast.git
FLYCAST_SITE_METHOD = git
FLYCAST_GIT_SUBMODULES = YES
FLYCAST_LICENSE = GPL-2.0
FLYCAST_LICENSE_FILES = LICENSE
FLYCAST_EMULATOR_INFO = flycast.emulator.yml
FLYCAST_SUPPORTS_IN_SOURCE_BUILD = NO

FLYCAST_DEPENDENCIES += libao libcurl libminiupnpc libzip sdl2 udev zlib

FLYCAST_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
FLYCAST_CONF_OPTS += -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=OFF
FLYCAST_CONF_OPTS += -DLIBRETRO=OFF
FLYCAST_CONF_OPTS += -DUSE_BREAKPAD=OFF
FLYCAST_CONF_OPTS += -DUSE_DISCORD=OFF
FLYCAST_CONF_OPTS += -DUSE_HOST_LIBZIP=ON
FLYCAST_CONF_OPTS += -DUSE_HOST_SDL=ON
FLYCAST_CONF_OPTS += -DUSE_OPENMP=ON

# The tarball has no .git, so pass the version in (see 002-add-version.patch)
FLYCAST_GIT_HASH = $(shell echo $(FLYCAST_VERSION) | cut -c1-9)
FLYCAST_GIT_TAG = $(shell $(BR2_GIT) -C $(FLYCAST_DL_DIR)/git describe --tags --always $(FLYCAST_VERSION) 2>/dev/null || echo $(FLYCAST_GIT_HASH))
FLYCAST_CONF_OPTS += -DGIT_VERSION=$(FLYCAST_GIT_TAG)
FLYCAST_CONF_OPTS += -DGIT_HASH=$(FLYCAST_GIT_HASH)

# OpenGL backend
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64_ANY),y)
FLYCAST_DEPENDENCIES += libgl
FLYCAST_CONF_OPTS += -DUSE_OPENGL=ON -DUSE_GLES=OFF -DUSE_GLES2=OFF
else ifeq ($(BR2_PACKAGE_BATOCERA_GLES3),y)
FLYCAST_DEPENDENCIES += libgles
FLYCAST_CONF_OPTS += -DUSE_OPENGL=ON -DUSE_GLES=ON -DUSE_GLES2=OFF
else ifeq ($(BR2_PACKAGE_BATOCERA_GLES2),y)
FLYCAST_DEPENDENCIES += libgles
FLYCAST_CONF_OPTS += -DUSE_OPENGL=ON -DUSE_GLES=OFF -DUSE_GLES2=ON
endif

# Vulkan backend, using the system glslang instead of the bundled one
ifeq ($(BR2_PACKAGE_BATOCERA_VULKAN),y)
FLYCAST_DEPENDENCIES += glslang
FLYCAST_CONF_OPTS += -DUSE_VULKAN=ON -DUSE_HOST_GLSLANG=ON
else
FLYCAST_CONF_OPTS += -DUSE_VULKAN=OFF
endif

# Optional libraries flycast picks up when present
ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
FLYCAST_DEPENDENCIES += alsa-lib
FLYCAST_CONF_OPTS += -DUSE_ALSA=ON
else
FLYCAST_CONF_OPTS += -DUSE_ALSA=OFF
endif

ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
FLYCAST_DEPENDENCIES += pulseaudio
FLYCAST_CONF_OPTS += -DUSE_PULSEAUDIO=ON
else
FLYCAST_CONF_OPTS += -DUSE_PULSEAUDIO=OFF
endif

ifeq ($(BR2_PACKAGE_LUA),y)
FLYCAST_DEPENDENCIES += lua
FLYCAST_CONF_OPTS += -DUSE_LUA=ON
else
FLYCAST_CONF_OPTS += -DUSE_LUA=OFF
endif

define FLYCAST_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/flycast $(TARGET_DIR)/usr/bin/flycast
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
