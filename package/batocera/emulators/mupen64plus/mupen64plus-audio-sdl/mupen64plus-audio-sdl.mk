################################################################################
#
# mupen64plus-audio-sdl
#
################################################################################
# Version: Commits on Jun 21, 2025
MUPEN64PLUS_AUDIO_SDL_VERSION = 07c866bd2b897fcbce2131dc36066c179422c3c9
MUPEN64PLUS_AUDIO_SDL_SITE = $(call github,mupen64plus,mupen64plus-audio-sdl,$(MUPEN64PLUS_AUDIO_SDL_VERSION))
MUPEN64PLUS_AUDIO_SDL_LICENSE = GPLv2
MUPEN64PLUS_AUDIO_SDL_DEPENDENCIES = sdl2 alsa-lib mupen64plus-core
MUPEN64PLUS_AUDIO_SDL_INSTALL_STAGING = YES

define MUPEN64PLUS_AUDIO_SDL_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
		CROSS_COMPILE="$(STAGING_DIR)/usr/bin/" \
		PREFIX="$(STAGING_DIR)/usr" \
		PKG_CONFIG="$(HOST_DIR)/bin/pkg-config" \
		HOST_CPU="$(MUPEN64PLUS_HOST_CPU)" \
		APIDIR="$(STAGING_DIR)/usr/include/mupen64plus" \
		GL_CFLAGS="$(MUPEN64PLUS_CORE_GL_CFLAGS)" \
		GL_LDLIBS="$(MUPEN64PLUS_GL_LDLIBS)" \
		-C $(@D)/projects/unix all $(MUPEN64PLUS_PARAMS) OPTFLAGS="$(TARGET_CXXFLAGS)"
endef

define MUPEN64PLUS_AUDIO_SDL_INSTALL_TARGET_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
		CROSS_COMPILE="$(STAGING_DIR)/usr/bin/" \
		PREFIX="$(TARGET_DIR)/usr/" \
		PKG_CONFIG="$(HOST_DIR)/bin/pkg-config" \
		HOST_CPU="$(MUPEN64PLUS_HOST_CPU)" \
		APIDIR="$(STAGING_DIR)/usr/include/mupen64plus" \
		GL_CFLAGS="$(MUPEN64PLUS_CORE_GL_CFLAGS)" \
		GL_LDLIBS="$(MUPEN64PLUS_GL_LDLIBS)" \
		INSTALL="/usr/bin/install" \
		INSTALL_STRIP_FLAG="" \
		-C $(@D)/projects/unix all $(MUPEN64PLUS_PARAMS) OPTFLAGS="$(TARGET_CXXFLAGS)" install
endef

$(eval $(generic-package))
