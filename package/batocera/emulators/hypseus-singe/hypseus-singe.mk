################################################################################
#
# hypseus-singe
#
################################################################################
# Version: Commits on Aug 30, 2026
HYPSEUS_SINGE_VERSION = a16e2521ee3233ef20c44e562008c47f4b4293df
HYPSEUS_SINGE_SITE = $(call github,DirtBagXon,hypseus-singe,$(HYPSEUS_SINGE_VERSION))
HYPSEUS_SINGE_LICENSE = GPL-3.0

HYPSEUS_SINGE_DEPENDENCIES += libmpeg2 libogg libvorbis libzip
HYPSEUS_SINGE_DEPENDENCIES += sdl3 sdl3_image sdl3_mixer sdl3_ttf zlib
HYPSEUS_SINGE_SUPPORTS_IN_SOURCE_BUILD = NO
HYPSEUS_SINGE_SUBDIR = src

HYPSEUS_SINGE_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
HYPSEUS_SINGE_CONF_OPTS += -DABSTRACT_SINGE=OFF
# Add the "Legacy" flags to bypass GCC 14 strictness
HYPSEUS_SINGE_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -Wno-error=implicit-function-declaration -Wno-error=int-conversion"
HYPSEUS_SINGE_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -Wno-error=implicit-function-declaration -Wno-error=int-conversion"

$(eval $(call register,hypseus-singe.emulator.yml))
$(eval $(call register-if-kconfig,BR2_PACKAGE_BATOCERA_VULKAN,graphics.hypseus-singe.emulator.yml))
$(eval $(call register-if-kconfig,BR2_PACKAGE_BATOCERA_TARGET_X86_ANY,scanlines.hypseus-singe.emulator.yml))

define HYPSEUS_SINGE_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/src/buildroot-build/hypseus $(TARGET_DIR)/usr/bin/hypseus
	mkdir -p $(TARGET_DIR)/usr/share/hypseus-singe

	# copy support files
	cp -pr $(@D)/pics $(TARGET_DIR)/usr/share/hypseus-singe
	cp -pr $(@D)/fonts $(TARGET_DIR)/usr/share/hypseus-singe
	cp -pr $(@D)/sound $(TARGET_DIR)/usr/share/hypseus-singe
	$(INSTALL) -m 0644 -t $(TARGET_DIR)/usr/share/hypseus-singe $(@D)/doc/*.ini

	#evmap config
	$(INSTALL) -m 0644 -D -t $(TARGET_DIR)/usr/share/evmapy $(HYPSEUS_SINGE_PKGDIR)/*.keys
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
