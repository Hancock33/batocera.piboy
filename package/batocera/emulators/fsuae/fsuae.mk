################################################################################
#
# fsuae
#
################################################################################
# Version: Commits on Sept 06, 2025
FSUAE_VERSION = d43f413b3aea6651a7eeefbc0cf29baed1f46907
FSUAE_SITE = $(call github,FrodeSolheim,fs-uae,$(FSUAE_VERSION))
FSUAE_LICENSE = GPLv2
FSUAE_DEPENDENCIES += libpng libmpeg2 libglib2 libcapsimage openal
FSUAE_DEPENDENCIES += sdl3 sdl3_image sdl3_ttf zlib
FSUAE_AUTORECONF = YES

FSUAE_CONF_OPTS += --disable-codegen


define FSUAE_INSTALL_EVMAPY
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	$(INSTALL) -D -m 0644 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/fsuae/*.keys \
		$(TARGET_DIR)/usr/share/evmapy/
endef

FSUAE_POST_INSTALL_TARGET_HOOKS = FSUAE_INSTALL_EVMAPY

$(eval $(autotools-package))
