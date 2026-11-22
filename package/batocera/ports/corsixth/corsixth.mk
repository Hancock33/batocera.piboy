################################################################################
#
# corsixth
#
################################################################################
# Version: Commits on Nov 15, 2026
CORSIXTH_VERSION = v0.70.3
CORSIXTH_SITE = $(call github,CorsixTH,CorsixTH,$(CORSIXTH_VERSION))
CORSIXTH_DEPENDENCIES = ffmpeg libcurl lpeg lua luafilesystem lua-lpeg-patterns luasec luasocket rtmidi
CORSIXTH_DEPENDENCIES += sdl2 sdl2_image sdl2_mixer
CORSIXTH_LICENSE = GPL-2.0
CORSIXTH_SUPPORTS_IN_SOURCE_BUILD = NO
CORSIXTH_EMULATOR_INFO = corsixth.emulator.yml

CORSIXTH_CONF_OPTS += -DWITH_LUAJIT=OFF
CORSIXTH_CONF_OPTS += -DWITH_UPDATE_CHECK=OFF

define CORSIXTH_INSTALL_EVMAPY
	mkdir -p $(TARGET_DIR)/usr/share/corsix-th
	ln -sf /usr/lib/lua/lfs.so $(TARGET_DIR)/usr/share/corsix-th
	ln -sf /usr/lib/lua/lpeg.so $(TARGET_DIR)/usr/share/corsix-th
	# evmap config
	$(INSTALL) -m 0644 -D $(CORSIXTH_PKGDIR)/corsixth.keys $(TARGET_DIR)/usr/share/evmapy/corsixth.keys
	$(INSTALL) -m 0644 -D $(CORSIXTH_PKGDIR)/corsixth.keys $(TARGET_DIR)/usr/share/evmapy/themehospital.keys
endef

CORSIXTH_POST_INSTALL_TARGET_HOOKS += CORSIXTH_INSTALL_EVMAPY

$(eval $(cmake-package))
$(eval $(emulator-info-package))
