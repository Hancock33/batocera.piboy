################################################################################
#
# stalker
#
################################################################################
# Version: Commits on Apr 28, 2023
STALKER_VERSION = 5c3701994c3e11b340dce70282122d44cd397336
STALKER_SITE = https://github.com/OpenXRay/xray-16.git
STALKER_SITE_METHOD=git
STALKER_GIT_SUBMODULES=YES

STALKER_DEPENDENCIES = sdl2 sdl2_mixer host-ninja
STALKER_LICENSE = GPL-2.0

STALKER_SUPPORTS_IN_SOURCE_BUILD = NO
STALKER_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
STALKER_CONF_OPTS += -DSDL2=ON
STALKER_CONF_OPTS += -GNinja

define STALKER_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(STALKER_BUILDDIR)
endef

define STALKER_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) $(BR2_CMAKE) --install $(STALKER_BUILDDIR)
endef

define STALKER_EVMAPY
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/stalker/stalker.keys $(TARGET_DIR)/usr/share/evmapy
endef

STALKER_POST_INSTALL_TARGET_HOOKS += STALKER_EVMAPY

$(eval $(cmake-package))
