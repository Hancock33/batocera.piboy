################################################################################
#
# vita3k
#
################################################################################
# Version: Commits on Apr 29, 2025
VITA3K_VERSION = 36b220eab60e8e6e43549902eb0e2c05bc41baf2
VITA3K_SITE = https://github.com/vita3k/vita3k
VITA3K_SITE_METHOD=git
VITA3K_GIT_SUBMODULES=YES
VITA3K_LICENSE = GPLv3
VITA3K_DEPENDENCIES = boost fmt libcurl libgtk3 libogg libvorbis python-ruamel-yaml
VITA3K_DEPENDENCIES += sdl2 sdl2_image sdl2_ttf zlib

VITA3K_SUPPORTS_IN_SOURCE_BUILD = NO

VITA3K_CONF_OPTS += -DCMAKE_C_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-gcc
VITA3K_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-g++
VITA3K_CONF_OPTS += -DBUILD_EXTERNAL=OFF
VITA3K_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
VITA3K_CONF_OPTS += -DUSE_DISCORD_RICH_PRESENCE=OFF
VITA3K_CONF_OPTS += -DUSE_VITA3K_UPDATE=OFF

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64),y)
    VITA3K_CONF_OPTS += -DXXH_X86DISPATCH_ALLOW_AVX=ON
else
    VITA3K_CONF_OPTS += -DXXH_X86DISPATCH_ALLOW_AVX=OFF
endif

define VITA3K_GET_SUBMODULE
	mkdir -p $(@D)/external
	cd $(@D)/external && git clone https://github.com/Vita3K/nativefiledialog-cmake
endef
VITA3K_POST_EXTRACT_HOOKS = VITA3K_GET_SUBMODULE

define VITA3K_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin/vita3k/
	$(TARGET_STRIP) $(@D)/buildroot-build/bin/Vita3K
	cp -R $(@D)/buildroot-build/bin/* $(TARGET_DIR)/usr/bin/vita3k/
endef

$(eval $(cmake-package))
