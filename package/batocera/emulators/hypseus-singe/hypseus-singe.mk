################################################################################
#
# hypseus-singe
#
################################################################################
# Version: Commits on Jan 05, 2026
HYPSEUS_SINGE_VERSION = 7f34531c6b76798057f3af69da531840139230d5
HYPSEUS_SINGE_SITE = $(call github,DirtBagXon,hypseus-singe,$(HYPSEUS_SINGE_VERSION))
HYPSEUS_SINGE_LICENSE = GPLv3

HYPSEUS_SINGE_DEPENDENCIES += libmpeg2 libogg libvorbis libzip
HYPSEUS_SINGE_DEPENDENCIES += sdl2 sdl2_image sdl2_mixer sdl2_ttf zlib
HYPSEUS_SINGE_SUPPORTS_IN_SOURCE_BUILD = NO
HYPSEUS_SINGE_SUBDIR = src

HYPSEUS_SINGE_TARGET_CFLAGS = $(TARGET_CFLAGS) -Wno-implicit-function-declaration -Wno-int-conversion
HYPSEUS_SINGE_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-g++
HYPSEUS_SINGE_CONF_OPTS += -DCMAKE_C_FLAGS="$(HYPSEUS_SINGE_TARGET_CFLAGS)"
HYPSEUS_SINGE_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF

$(eval $(call register,hypseus-singe.emulator.yml))
$(eval $(call register-if-kconfig,BR2_PACKAGE_BATOCERA_VULKAN,graphics.hypseus-singe.emulator.yml))
$(eval $(call register-if-kconfig,BR2_PACKAGE_BATOCERA_TARGET_X86_ANY,scanlines.hypseus-singe.emulator.yml))

define HYPSEUS_SINGE_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/buildroot-build/hypseus $(TARGET_DIR)/usr/bin/
	mkdir -p $(TARGET_DIR)/usr/share/hypseus-singe

	# copy support files
	cp -pr $(@D)/pics $(TARGET_DIR)/usr/share/hypseus-singe
	cp -pr $(@D)/fonts $(TARGET_DIR)/usr/share/hypseus-singe
	cp -pr $(@D)/sound $(TARGET_DIR)/usr/share/hypseus-singe
	cp -pf $(@D)/doc/*.ini $(TARGET_DIR)/usr/share/hypseus-singe

	#evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp -f $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/hypseus-singe/*.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
