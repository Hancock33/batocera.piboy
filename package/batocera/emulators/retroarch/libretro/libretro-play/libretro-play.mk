################################################################################
#
# libretro-play
#
################################################################################
# Version: Commits on Jun 06, 2025
LIBRETRO_PLAY_VERSION = 5917411fbf30c56c4d0e9ade635c4acf8102dd8c
LIBRETRO_PLAY_SOURCE = play-$(LIBRETRO_PLAY_VERSION)-git4.tar.gz
LIBRETRO_PLAY_SITE = https://github.com/jpd002/Play-.git
LIBRETRO_PLAY_SITE_METHOD = git
LIBRETRO_PLAY_GIT_SUBMODULES = YES
LIBRETRO_PLAY_SUPPORTS_IN_SOURCE_BUILD = NO
LIBRETRO_PLAY_LICENSE = BSD
LIBRETRO_PLAY_DEPENDENCIES = retroarch

LIBRETRO_PLAY_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
LIBRETRO_PLAY_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
LIBRETRO_PLAY_CONF_OPTS += -DBUILD_TESTS=OFF
LIBRETRO_PLAY_CONF_OPTS += -DBUILD_LIBRETRO_CORE=ON
LIBRETRO_PLAY_CONF_OPTS += -DBUILD_PLAY=OFF
LIBRETRO_PLAY_CONF_OPTS += -DENABLE_AMAZON_S3=ON

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64_ANY),y)
    LIBRETRO_PLAY_DEPENDENCIES = libglew
endif

# Force to use GLES on ARM
ifeq ($(BR2_aarch64)$(BR2_arm),y)
    LIBRETRO_PLAY_CONF_OPTS += -DUSE_GLEW=OFF
    LIBRETRO_PLAY_CONF_OPTS += -DUSE_GLES=ON
endif

ifeq ($(BR2_aarch64),y)
    LIBRETRO_PLAY_CONF_OPTS += -DTARGET_PLATFORM_UNIX_AARCH64=YES
else ifeq ($(BR2_arm),y)
    LIBRETRO_PLAY_CONF_OPTS += -DTARGET_PLATFORM_UNIX_ARM=YES
endif

define LIBRETRO_PLAY_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/buildroot-build/Source/ui_libretro/play_libretro.so $(TARGET_DIR)/usr/lib/libretro/play_libretro.so
endef

$(eval $(cmake-package))
