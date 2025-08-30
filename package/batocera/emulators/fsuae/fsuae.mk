################################################################################
#
# fsuae
#
################################################################################
# Version: Commits on Aug 29, 2025
FSUAE_VERSION = 3ea96e4a5938748150877d41b3ce64a87276b8c2
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
