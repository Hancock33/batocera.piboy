################################################################################
#
# vita3k
#
################################################################################
# Version: Commits on Jun 12, 2026
VITA3K_VERSION = 985ac699c600277d5012ac06caa8212e6f5bf230
VITA3K_SITE = https://github.com/vita3k/vita3k
VITA3K_SITE_METHOD = git
VITA3K_GIT_SUBMODULES = YES
VITA3K_LICENSE = GPLv3
VITA3K_DEPENDENCIES += boost host-clang host-ninja libcurl libogg libvorbis pipewire python-ruamel-yaml
VITA3K_DEPENDENCIES += qt6base qt6multimedia qt6svg qt6tools sdl3 sdl3_image sdl3_ttf zlib
VITA3K_EXTRACT_DEPENDENCIES = host-libcurl
VITA3K_EMULATOR_INFO = vita3k.emulator.yml

VITA3K_SUPPORTS_IN_SOURCE_BUILD = NO

VITA3K_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
VITA3K_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS="-no-pie -lm -lstdc++"
VITA3K_CONF_OPTS += -DSDL_HIDAPI=OFF
VITA3K_CONF_OPTS += -DUSE_DISCORD_RICH_PRESENCE=OFF
VITA3K_CONF_OPTS += -DVITA3K_FORCE_SYSTEM_BOOST=ON

ifeq ($(BR2_PACKAGE_WAYLAND),y)
    VITA3K_DEPENDENCIES += wayland
endif

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64),y)
    VITA3K_CONF_OPTS += -DXXH_X86DISPATCH_ALLOW_AVX=ON
else
    VITA3K_CONF_OPTS += -DXXH_X86DISPATCH_ALLOW_AVX=OFF
endif

define VITA3K_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin/vita3k/
	$(TARGET_STRIP) $(@D)/buildroot-build/bin/Vita3K
	cp -R $(@D)/buildroot-build/bin/* $(TARGET_DIR)/usr/bin/vita3k/
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
