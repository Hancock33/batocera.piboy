################################################################################
#
# flycast
#
################################################################################
# Version: Commits on May 21, 2025
FLYCAST_VERSION = f26e10e44a2d6dbceba6ea98cfafddc2bc6d431e
FLYCAST_SITE = https://github.com/flyinghead/flycast.git
FLYCAST_SITE_METHOD=git
FLYCAST_GIT_SUBMODULES=YES
FLYCAST_LICENSE = GPLv2
FLYCAST_DEPENDENCIES = libao libcurl libminiupnpc libpng libzip sdl2
FLYCAST_SUPPORTS_IN_SOURCE_BUILD = NO

FLYCAST_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
FLYCAST_CONF_OPTS += -DLIBRETRO=OFF
FLYCAST_CONF_OPTS += -DUSE_BREAKPAD=OFF
FLYCAST_CONF_OPTS += -DUSE_HOST_SDL=ON

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64_ANY),y)
    FLYCAST_CONF_OPTS += -DUSE_OPENGL=ON
else ifeq ($(BR2_PACKAGE_BATOCERA_GLES3),y)
    FLYCAST_CONF_OPTS += -DUSE_GLES=ON -DUSE_GLES2=OFF -DUSE_OPENGL=ON
else ifeq ($(BR2_PACKAGE_BATOCERA_GLES2),y)
    FLYCAST_CONF_OPTS += -DUSE_GLES2=ON -DUSE_GLES=OFF -DUSE_OPENGL=ON
endif

ifeq ($(BR2_PACKAGE_BATOCERA_VULKAN),y)
    FLYCAST_CONF_OPTS += -DUSE_VULKAN=ON -DUSE_HOST_GLSLANG=ON
else
    FLYCAST_CONF_OPTS += -DUSE_VULKAN=OFF
endif

define FLYCAST_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/buildroot-build/flycast $(TARGET_DIR)/usr/bin/flycast
endef

define FLYCAST_GET_SUBMODULE
	rm -rf $(@D)/core/deps/glslang
endef
FLYCAST_POST_EXTRACT_HOOKS = FLYCAST_GET_SUBMODULE

$(eval $(cmake-package))
