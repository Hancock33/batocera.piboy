################################################################################
#
# vita3k
#
################################################################################
# Version: Commits on Aug 25, 2024
VITA3K_VERSION = f01a4e9b63583aa901f37a54523360be33034ccb
VITA3K_SITE = https://github.com/vita3k/vita3k
VITA3K_SITE_METHOD=git
VITA3K_GIT_SUBMODULES=YES
VITA3K_LICENSE = GPLv3
VITA3K_DEPENDENCIES = sdl2 sdl2_image sdl2_ttf zlib libogg libvorbis python-ruamel-yaml

VITA3K_SUPPORTS_IN_SOURCE_BUILD = NO

VITA3K_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
VITA3K_CONF_OPTS += -DUSE_DISCORD_RICH_PRESENCE=OFF
VITA3K_CONF_OPTS += -DUSE_VITA3K_UPDATE=OFF
VITA3K_CONF_OPTS += -DBUILD_EXTERNAL=ON
VITA3K_CONF_OPTS += -DXXH_X86DISPATCH_ALLOW_AVX=ON
VITA3K_CONF_OPTS += -DCMAKE_C_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-gcc
VITA3K_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-g++

ifeq ($(BR2_x86_x86_64_v3),y)
    VITA3K_CONF_OPTS += -DXXH_X86DISPATCH_ALLOW_AVX=ON
else
    VITA3K_CONF_OPTS += -DXXH_X86DISPATCH_ALLOW_AVX=OFF
endif

define VITA3K_GET_SUBMODULE
    mkdir -p $(@D)/external
    cd $(@D)/external && git clone https://github.com/Vita3K/nativefiledialog-cmake
endef

define VITA3K_FFMPEG_GIT
    mkdir $(@D)/.git/
    cp -ruv $(DL_DIR)/$(VITA3K_DL_SUBDIR)/git/.git/* $(@D)/.git/
endef

define VITA3K_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/usr/bin/vita3k/
	cp -R $(@D)/buildroot-build/bin/* $(TARGET_DIR)/usr/bin/vita3k/
endef

define VITA3K_INSTALL_EVMAPY
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/vita3k/psvita.vita3k.keys \
        $(TARGET_DIR)/usr/share/evmapy
endef

VITA3K_PRE_CONFIGURE_HOOKS = VITA3K_GET_SUBMODULE
VITA3K_PRE_CONFIGURE_HOOKS += VITA3K_FFMPEG_GIT
VITA3K_POST_INSTALL_TARGET_HOOKS = VITA3K_INSTALL_EVMAPY

$(eval $(cmake-package))
