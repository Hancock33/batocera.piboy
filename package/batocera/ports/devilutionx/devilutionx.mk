################################################################################
#
# devilutionx
#
################################################################################
# Version: Commits on Apr 18, 2023
DEVILUTIONX_VERSION = c91feb71f9d3cfc9c69adf6650a74104e31798a4
DEVILUTIONX_SITE = https://github.com/diasurgical/devilutionX.git
DEVILUTIONX_SITE_METHOD=git
DEVILUTIONX_SUBDIR = dist-src

DEVILUTIONX_DEPENDENCIES = sdl2 sdl2_image fmt libsodium libpng bzip2
DEVILUTIONX_SUPPORTS_IN_SOURCE_BUILD = NO

# Prefill the player name when creating a new character, in case the device does
# not have a keyboard.
DEVILUTIONX_CONF_OPTS += -DBUILD_TESTING=OFF -DPREFILL_PLAYER_NAME=ON \
                         -DCMAKE_BUILD_TYPE=Release

# Ensure that DevilutionX's vendored dependencies are not accidentally fetched from network.
# They should all be present in the source package.
DEVILUTIONX_CONF_OPTS += -DFETCHCONTENT_FULLY_DISCONNECTED=ON

# ZeroTier on aarch64 uses ARMv8 Cryptography Extensions.
# These extension are optional and only certain Armv8-A CPUs support them.
# Disables ZeroTier if the CPU compilation flags do not specify the "+crypto" extension.
ifeq ($(BR2_aarch64)$(BR2_ARM_CPU_ARMV8A),yy)
    ifneq ($(findstring +crypto,$(BR2_TARGET_OPTIMIZATION)),+crypto)
        DEVILUTIONX_CONF_OPTS += -DDISABLE_ZERO_TIER=ON
    endif
else ifeq ($(BR2_arm),y)
    DEVILUTIONX_CONF_OPTS += -DDISABLE_ZERO_TIER=ON
endif

define DEVILUTIONX_FIX_SDL2MAIN
	sed -i -e s+"SDL2::SDL2main"+"-lSDL2main"+ $(@D)/dist-src/CMakeLists.txt
	sed -i -e s+"SDL2::SDL2_image"+"-lSDL2_image"+ $(@D)/dist-src/Source/CMakeLists.txt
	#sed -i -e s+"VERSION ${VERSION_NUM}"+"VERSION 1.4.99"+ $(@D)/dist-src/CMakeLists.txt
endef

define DEVILUTIONX_BUILD_SRC_DIST
    rm -rf $(DEVILUTIONX_DL_DIR)/git/build-src-dist/
	python $(DEVILUTIONX_DL_DIR)/git/tools/make_src_dist.py
	tar -xf $(DEVILUTIONX_DL_DIR)/git/build-src-dist/devilutionx-src-*.tar.xz -C $(@D)
	mv $(@D)/devilutionx-src-* $(@D)/dist-src
endef

DEVILUTIONX_PRE_CONFIGURE_HOOKS += DEVILUTIONX_FIX_SDL2MAIN
DEVILUTIONX_POST_EXTRACT_HOOKS += DEVILUTIONX_BUILD_SRC_DIST

define DEVILUTIONX_INSTALL_TARGET_EVMAPY
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/devilutionx/devilutionx.keys $(TARGET_DIR)/usr/share/evmapy
endef

DEVILUTIONX_POST_INSTALL_TARGET_HOOKS = DEVILUTIONX_INSTALL_TARGET_EVMAPY

$(eval $(cmake-package))
