################################################################################
#
# corsixth
#
################################################################################
# Version: Commits on Jul 30, 2023
CORSIXTH_VERSION = 2d1b47cd198fb7e6c3d16e0e9d092c25ac1fc482
CORSIXTH_SITE = $(call github,CorsixTH,CorsixTH,$(CORSIXTH_VERSION))
CORSIXTH_DEPENDENCIES = sdl2 sdl2_mixer host-ninja
CORSIXTH_LICENSE = GPL-2.0
CORSIXTH_SUPPORTS_IN_SOURCE_BUILD = NO

CORSIXTH_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -DWITH_LIBAV=ON -GNinja

ifeq ($(BR2_PACKAGE_LUAJIT),y)
CORSIXTH_CONF_OPTS += -DWITH_LUAJIT=ON
CORSIXTH_CONF_ENV += LDFLAGS="-lluajit-5.2"
endif

define CORSIXTH_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(CORSIXTH_BUILDDIR)
endef

define CORSIXTH_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) $(BR2_CMAKE) --install $(CORSIXTH_BUILDDIR)
endef

define CORSIXTH_INSTALL_EXTRAS
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/corsixth/corsixth.keys $(TARGET_DIR)/usr/share/evmapy/themehospital.keys
endef

CORSIXTH_PRE_INSTALL_TARGET_HOOKS += CORSIXTH_INSTALL_EXTRAS

$(eval $(cmake-package))
