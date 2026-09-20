################################################################################
#
# dosbox-staging
#
################################################################################
# Version: Commits on Aug 26, 2026
DOSBOX_STAGING_VERSION = v0.83.0
DOSBOX_STAGING_SITE = $(call github,dosbox-staging,dosbox-staging,$(DOSBOX_STAGING_VERSION))
DOSBOX_STAGING_DEPENDENCIES = alsa-lib asio fluidsynth iir libogg libpng libvorbis mt32emu
DOSBOX_STAGING_DEPENDENCIES += opus opusfile sdl2 sdl2_image slirp speexdsp zlib
DOSBOX_STAGING_CMAKE_BACKEND = make
DOSBOX_STAGING_LICENSE = GPLv2
DOSBOX_STAGING_EMULATOR_INFO = dosbox_staging.emulator.yml

DOSBOX_STAGING_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
DOSBOX_STAGING_CONF_OPTS += -DUSE_SYSTEM_LIBS=ON
DOSBOX_STAGING_CONF_OPTS += -DIS_PRESET_USED=ON
DOSBOX_STAGING_CONF_OPTS += -DOPT_TESTS=OFF

ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
DOSBOX_STAGING_DEPENDENCIES += libgl
DOSBOX_STAGING_CONF_OPTS += -DOPT_OPENGL=ON
else
DOSBOX_STAGING_CONF_OPTS += -DOPT_OPENGL=OFF
endif

define DOSBOX_STAGING_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/dosbox-staging $(TARGET_DIR)/usr/bin/dosbox-staging
	mkdir -p $(TARGET_DIR)/usr/share/dosbox-staging
	rsync -a --exclude='meson.build' --exclude='.git*' $(@D)/resources/ $(TARGET_DIR)/usr/share/dosbox-staging/
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
