################################################################################
#
# dosbox-staging
#
################################################################################
# Version: Commits on Jun 17, 2025
DOSBOX_STAGING_VERSION = f8c24f87d7fb0f41c2b7ef2a1aa97d16a52206be
DOSBOX_STAGING_BRANCH = release/0.82.x
DOSBOX_STAGING_SITE = $(call github,dosbox-staging,dosbox-staging,$(DOSBOX_STAGING_VERSION))
DOSBOX_STAGING_DEPENDENCIES = iir libpng libogg libvorbis mt32emu opus opusfile
DOSBOX_STAGING_DEPENDENCIES += sdl2 sdl2_image speexdsp zlib
DOSBOX_STAGING_LICENSE = GPLv2
DOSBOX_STAGING_EMULATOR_INFO = dosbox_staging.emulator.yml

DOSBOX_STAGING_CONF_ENV += SSL_CERT_DIR=/etc/ssl/certs

DOSBOX_STAGING_CONF_OPTS = \
	-Dasm=false \
	-Dautovec_info=false \
	-Dnarrowing_warnings=false \
	-Dtime_trace=false \
	-Dtracy=false \
	-Dunit_tests=disabled \
	-Duse_mt32emu=true

ifeq ($(BR2_PACKAGE_SDL2_NET),y)
DOSBOX_STAGING_CONF_OPTS += -Duse_sdl2_net=true
DOSBOX_STAGING_DEPENDENCIES += sdl2_net
else
DOSBOX_STAGING_CONF_OPTS += -Duse_sdl2_net=false
endif

ifeq ($(BR2_PACKAGE_FLUIDSYNTH),y)
DOSBOX_STAGING_CONF_OPTS += -Duse_fluidsynth=true
DOSBOX_STAGING_DEPENDENCIES += fluidsynth
else
DOSBOX_STAGING_CONF_OPTS += -Duse_fluidsynth=false
endif

ifeq ($(BR2_PACKAGE_SLIRP),y)
DOSBOX_STAGING_CONF_OPTS += -Duse_slirp=true
DOSBOX_STAGING_DEPENDENCIES += slirp
else
DOSBOX_STAGING_CONF_OPTS += -Duse_slirp=false
endif

ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
DOSBOX_STAGING_CONF_OPTS += -Duse_alsa=true
DOSBOX_STAGING_DEPENDENCIES += alsa-lib
else
DOSBOX_STAGING_CONF_OPTS += -Duse_alsa=false
endif

ifneq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64_ANY),y)
DOSBOX_STAGING_CONF_OPTS += -Duse_opengl=false
endif

define DOSBOX_STAGING_ORIGINAL
	mv $(TARGET_DIR)/usr/bin/dosbox $(TARGET_DIR)/usr/bin/dosbox-staging
endef

DOSBOX_STAGING_POST_INSTALL_TARGET_HOOKS = DOSBOX_STAGING_ORIGINAL

$(eval $(meson-package))
$(eval $(emulator-info-package))
