################################################################################
#
# fallout1
#
################################################################################
# Version: Commits on Jun 12, 2023
FALLOUT1_VERSION = 55fb75bc7799830ac1a6dab71555fb9ef8c1e690
FALLOUT1_SITE = $(call github,alexbatalov,fallout1-ce,$(FALLOUT1_VERSION))

FALLOUT1_DEPENDENCIES = sdl2 sdl2_image sdl2_mixer sdl2_net sdl2_ttf host-ninja
FALLOUT1_LICENSE = GPL-3.0
FALLOUT1_SUPPORTS_IN_SOURCE_BUILD = NO

FALLOUT1_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -GNinja

define FALLOUT1_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(FALLOUT1_BUILDDIR)
endef

define FALLOUT1_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/buildroot-build/fallout-ce $(TARGET_DIR)/usr/bin/fallout-ce
endef

$(eval $(cmake-package))
