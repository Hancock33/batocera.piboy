################################################################################
#
# libretro-uzdoom
#
################################################################################
# Version: Commits on Nov 05, 2026
LIBRETRO_UZDOOM_VERSION = e2dcfec9551d5f53cb6dced07177c25bc53a307a
LIBRETRO_UZDOOM_SITE = https://github.com/cscd98/UZDoom-libretro.git
LIBRETRO_UZDOOM_SITE_METHOD = git
LIBRETRO_UZDOOM_GIT_SUBMODULES = YES
LIBRETRO_UZDOOM_LICENSE = GPL-3.0+
LIBRETRO_UZDOOM_LICENSE_FILES = LICENSE
LIBRETRO_UZDOOM_SUPPORTS_IN_SOURCE_BUILD = NO
LIBRETRO_UZDOOM_DEPENDENCIES = retroarch host-python3 bzip2 libvpx openal
LIBRETRO_UZDOOM_EMULATOR_INFO = uzdoom.libretro.core.yml

LIBRETRO_UZDOOM_CONF_OPTS += -DENABLE_LIBRETRO=ON
LIBRETRO_UZDOOM_CONF_OPTS += -DENABLE_LIBRETRO_STATIC_BUILD=OFF
LIBRETRO_UZDOOM_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
LIBRETRO_UZDOOM_CONF_OPTS += -DNO_GTK=ON

ifeq ($(BR2_PACKAGE_BATOCERA_VULKAN),y)
    LIBRETRO_UZDOOM_DEPENDENCIES += glslang
    LIBRETRO_UZDOOM_CONF_OPTS += -DHAVE_VULKAN=ON
else
    LIBRETRO_UZDOOM_CONF_OPTS += -DHAVE_VULKAN=OFF
endif

ifneq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64_ANY),y)
    LIBRETRO_UZDOOM_CONF_OPTS += -DHAVE_GLES2=ON
    LIBRETRO_UZDOOM_DEPENDENCIES += libgles
else
    LIBRETRO_UZDOOM_CONF_OPTS += -DHAVE_GLES2=OFF
    LIBRETRO_UZDOOM_DEPENDENCIES += libgl
endif

define LIBRETRO_UZDOOM_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/buildroot-build/uzdoom_libretro.so $(TARGET_DIR)/usr/lib/libretro/uzdoom_libretro.so
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
