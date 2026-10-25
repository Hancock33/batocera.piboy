################################################################################
#
# gametank-emulator
#
################################################################################
# Version: Commits on Oct 22, 2026
GAMETANK_EMULATOR_VERSION = be32deab74b7778647273fa5616d1ea92e3e1267
GAMETANK_EMULATOR_SITE = https://github.com/clydeshaffer/GameTankEmulator
GAMETANK_EMULATOR_SITE_METHOD = git
GAMETANK_EMULATOR_GIT_SUBMODULES = YES
GAMETANK_EMULATOR_LICENSE = MIT, Zlib
GAMETANK_EMULATOR_LICENSE_FILE = LICENSE
GAMETANK_EMULATOR_EMULATOR_INFO = gametank-emulator.emulator.yml

GAMETANK_EMULATOR_DEPENDENCIES = sdl2

GAMETANK_EMULATOR_INCLUDES += -Isrc/imgui -Isrc/imgui/backends
GAMETANK_EMULATOR_INCLUDES += -Isrc/imgui/ext/implot -Isrc/whereami

define GAMETANK_EMULATOR_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
		CC="$(TARGET_CC)" \
		CPPC="$(TARGET_CXX)" \
		OPTIM_FLAGS="$(TARGET_CFLAGS)" \
		COMPILER_FLAGS="$$($(STAGING_DIR)/usr/bin/sdl2-config --cflags) \
		$(GAMETANK_EMULATOR_INCLUDES)" \
		LINKER_FLAGS="$$($(STAGING_DIR)/usr/bin/sdl2-config --libs)" \
		bin
endef

define GAMETANK_EMULATOR_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/build/GameTankEmulator \
	    $(TARGET_DIR)/usr/bin/gametank-emulator
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
