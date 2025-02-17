################################################################################
#
# vita3k
#
################################################################################
# Version: Commits on Feb 05, 2025
VITA3K_VERSION = 3d53d7cb93ada60076925d73aa20d39c08ea4409
VITA3K_SITE = https://github.com/vita3k/vita3k
VITA3K_SITE_METHOD=git
VITA3K_GIT_SUBMODULES=YES
VITA3K_LICENSE = GPLv3
VITA3K_DEPENDENCIES = sdl2 sdl2_image sdl2_ttf zlib libogg libvorbis python-ruamel-yaml boost libgtk3
VITA3K_EXTRACT_DEPENDENCIES = host-libcurl

VITA3K_SUPPORTS_IN_SOURCE_BUILD = NO

VITA3K_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
VITA3K_CONF_OPTS += -DUSE_DISCORD_RICH_PRESENCE=OFF
VITA3K_CONF_OPTS += -DUSE_VITA3K_UPDATE=OFF
VITA3K_CONF_OPTS += -DBUILD_EXTERNAL=ON
VITA3K_CONF_OPTS += -DCMAKE_C_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-gcc
VITA3K_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-g++

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
