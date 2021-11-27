################################################################################
#
# Freedroid Classic (Paradroid Clone)
#
################################################################################
# Version.: Commits on Apr 07, 2021
FREEDROID_VERSION = 2d5cf64ff5227ee55e133ba392b8ace74d1df2cc
FREEDROID_SITE = $(call github,ReinhardPrix,FreedroidClassic,$(FREEDROID_VERSION))

FREEDROID_DEPENDENCIES = sdl sdl_mixer sdl_image sdl_gfx
FREEDROID_LICENSE = GPL-2.0

FREEDROID_SUPPORTS_IN_SOURCE_BUILD = NO
FREEDROID_CONF_OPTS +=  --with-sdl-prefix="$(STAGING_DIR)/usr"

define FREEDROID_RUN_AUTOGEN
	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
endef
FREEDROID_PRE_CONFIGURE_HOOKS += FREEDROID_RUN_AUTOGEN

define FREEDROID_INSTALL_TARGET_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
		PREFIX=/usr \
		STRIP=/bin/true \
		DESTDIR=$(TARGET_DIR) \
		install
	# evmap config
	#mkdir -p $(TARGET_DIR)/usr/share/evmapy
	#cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/FREEDROID/FREEDROID.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(autotools-package))

