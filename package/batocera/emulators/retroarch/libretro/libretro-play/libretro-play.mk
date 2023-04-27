################################################################################
#
# libretro-play
#
################################################################################
# Version: Commits on Apr 22, 2023
LIBRETRO_PLAY_VERSION = bcb8bce98bf978bc6a5354acf4a6f5a082a7dea5
LIBRETRO_PLAY_SOURCE = play-$(LIBRETRO_PLAY_VERSION)-br1.tar.gz
LIBRETRO_PLAY_SITE = https://github.com/jpd002/Play-.git
LIBRETRO_PLAY_LICENSE = BSD
LIBRETRO_PLAY_DEPENDENCIES = libglew host-ninja

LIBRETRO_PLAY_SITE_METHOD = git
LIBRETRO_PLAY_GIT_SUBMODULES = YES

LIBRETRO_PLAY_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -GNinja
LIBRETRO_PLAY_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
LIBRETRO_PLAY_CONF_OPTS += -DBUILD_TESTS=OFF
LIBRETRO_PLAY_CONF_OPTS += -DBUILD_LIBRETRO_CORE=ON
LIBRETRO_PLAY_CONF_OPTS += -DBUILD_PLAY=OFF
LIBRETRO_PLAY_CONF_OPTS += -DENABLE_AMAZON_S3=ON
# Force to use GLES on ARM
#LIBRETRO_PLAY_CONF_OPTS += -DUSE_GLEW=OFF
#LIBRETRO_PLAY_CONF_OPTS += -DUSE_GLES=ON

define LIBRETRO_PLAY_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(LIBRETRO_PLAY_BUILDDIR)
endef

define LIBRETRO_PLAY_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/Source/ui_libretro/play_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/play_libretro.so
endef

$(eval $(cmake-package))
