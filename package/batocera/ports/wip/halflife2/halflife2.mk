################################################################################
#
# halflife2
#
################################################################################
# Version: Commits on Aug 22, 2023
HALFLIFE2_VERSION = 1d4f7fb2cc8c48e22fa038192ffa13860f4abe99
HALFLIFE2_SITE = https://github.com/nillerusr/source-engine.git
HALFLIFE2_SITE_METHOD = git
HALFLIFE2_GIT_SUBMODULES = yes
XASH3D_LICENSE = GPL-3.0+
HALFLIFE2_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image sdl2_ttf freetype fontconfig

HALFLIFE2_CONF_OPTS += --build-type=release \
  --enable-opus \
  --strip \
  --disable-warns \
  --sdl2=$(STAGING_DIR)/usr/ \
  --prefix=/usr/bin/hl2

ifeq ($(BR2_ARCH_IS_64),y)
  HALFLIFE2_CONF_OPTS += --64bits
endif

define HALFLIFE2_REMOVE_EXISTING
	rm -rf $(TARGET_DIR)/usr/bin/hl2
endef

define HALFLIFE2_EVMAPY
	# move hl2 assest
	mv $(TARGET_DIR)/usr/bin/hl2/hl2          $(TARGET_DIR)/usr/bin/hl2/hl2_assets
	ln -sf /userdata/roms/ports/halflife2/hl2 $(TARGET_DIR)/usr/bin/hl2/hl2
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/wip/halflife2/halflife2.keys $(TARGET_DIR)/usr/share/evmapy
endef

HALFLIFE2_PRE_CONFIGURE_HOOKS = HALFLIFE2_REMOVE_EXISTING
HALFLIFE2_POST_INSTALL_TARGET_HOOKS += HALFLIFE2_EVMAPY

$(eval $(waf-package))
