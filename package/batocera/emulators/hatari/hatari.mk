################################################################################
#
# hatari
#
################################################################################
# Version: Commits on May 04, 2023
HATARI_VERSION = 510557e89a4c1e9dbe34225a66def0a523077c32
HATARI_SITE = $(call github,hatari,hatari,$(HATARI_VERSION))
HATARI_LICENSE = GPLv3
HATARI_DEPENDENCIES = sdl2 zlib libpng libcapsimage host-ninja

HATARI_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
HATARI_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
HATARI_CONF_OPTS += -DCAPSIMAGE_INCLUDE_DIR="($STAGING_DIR)/usr/include/caps"
HATARI_CONF_OPTS  = -GNinja

define HATARI_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(HATARI_BUILDDIR)
endef

define HATARI_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/hatari $(TARGET_DIR)/usr/bin/hatari
        mkdir -p $(TARGET_DIR)/usr/share/hatari

    # evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/hatari/*.keys $(TARGET_DIR)/usr/share/evmapy
endef

define HATARI_INSTALL_EVMAPY
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	$(INSTALL) -D -m 0644 \
	    $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/hatari/atarist.hatari.keys \
	        $(TARGET_DIR)/usr/share/evmapy/atarist.hatari.keys
endef

HATARI_POST_INSTALL_TARGET_HOOKS = HATARI_INSTALL_EVMAPY

$(eval $(cmake-package))
