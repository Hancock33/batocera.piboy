################################################################################
#
# doom3
#
################################################################################
# Version: Commits on Mar 28, 2023
DOOM3_VERSION = 03fccc622065a48dfe9de2f7dc4d3fa7bc442a6a
DOOM3_SITE = $(call github,dhewm,dhewm3,$(DOOM3_VERSION))

DOOM3_DEPENDENCIES = sdl2 sdl2_mixer host-ninja
DOOM3_LICENSE = GPL-2.0

DOOM3_SUPPORTS_IN_SOURCE_BUILD = NO
DOOM3_SUBDIR = neo

DOOM3_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -GNinja
DOOM3_CONF_OPTS += -DSDL2=ON

define DOOM3_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(DOOM3_BUILDDIR)
endef

define DOOM3_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) $(BR2_CMAKE) --install $(DOOM3_BUILDDIR)
endef

define DOOM3_KEYS
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/doom/doom3/doom3.keys $(TARGET_DIR)/usr/share/evmapy
endef

DOOM3_PRE_INSTALL_TARGET_HOOKS += DOOM3_KEYS

$(eval $(cmake-package))
