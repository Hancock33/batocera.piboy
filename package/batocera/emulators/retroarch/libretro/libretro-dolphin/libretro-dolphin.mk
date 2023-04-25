################################################################################
#
# libretro-dolphin
#
################################################################################
# Version: Commits on Dec 17, 2022
LIBRETRO_DOLPHIN_VERSION = 2f4b0f7902257d40a054f60b2c670d6e314f2a04
LIBRETRO_DOLPHIN_SITE = https://github.com/libretro/dolphin
LIBRETRO_DOLPHIN_SITE_METHOD=git
LIBRETRO_DOLPHIN_GIT_SUBMODULES=YES
LIBRETRO_DOLPHIN_LICENSE = GPLv2
LIBRETRO_DOLPHIN_DEPENDENCIES = libevdev fmt bluez5_utils host-ninja

LIBRETRO_DOLPHIN_PLATFORM = $(LIBRETRO_PLATFORM)

LIBRETRO_DOLPHIN_CONF_OPTS = -DLIBRETRO=ON -DBUILD_SHARED_LIBS=OFF \
							 -DENABLE_LTO=ON -DCMAKE_BUILD_TYPE=Release -GNinja

ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER),y)
LIBRETRO_DOLPHIN_DEPENDENCIES += xserver_xorg-server
LIBRETRO_DOLPHIN_CONF_OPTS += -DENABLE_X11=ON
LIBRETRO_DOLPHIN_CONF_OPTS += -DENABLE_EGL=OFF
endif

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RK3588),y)
LIBRETRO_DOLPHIN_CONF_OPTS += -DENABLE_X11=OFF
LIBRETRO_DOLPHIN_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="-lmali_hook -Wl,--whole-archive -lmali_hook_injector -Wl,--no-whole-archive -lmali"
LIBRETRO_DOLPHIN_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS="-lmali_hook -Wl,--whole-archive -lmali_hook_injector -Wl,--no-whole-archive -lmali"
endif

define LIBRETRO_DOLPHIN_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(LIBRETRO_DOLPHIN_BUILDDIR)
endef

define LIBRETRO_DOLPHIN_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/dolphin_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/dolphin_libretro.so
endef

$(eval $(cmake-package))
