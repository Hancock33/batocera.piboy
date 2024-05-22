################################################################################
#
# libretro-uoyabause
#
################################################################################
# Version: Commits on Feb 13, 2024
LIBRETRO_UOYABAUSE_VERSION = c60e60854ae5bdef3f463a784674e8fe8c7d87f0
LIBRETRO_UOYABAUSE_BRANCH = libretro-cmake-rpi4
LIBRETRO_UOYABAUSE_SITE = https://github.com/rob-ack/yabause.git
LIBRETRO_UOYABAUSE_SITE_METHOD=git
LIBRETRO_UOYABAUSE_GIT_SUBMODULES=YES
LIBRETRO_UOYABAUSE_LICENSE = GPLv2
LIBRETRO_UOYABAUSE_SUBDIR = yabause
LIBRETRO_UOYABAUSE_CMAKE_BACKEND = make

LIBRETRO_UOYABAUSE_CONF_OPTS += -DYAB_PORTS=libretro
LIBRETRO_UOYABAUSE_CONF_OPTS += -DYAB_USE_QT5=False
LIBRETRO_UOYABAUSE_CONF_OPTS += -DSH2_DYNAREC=False
LIBRETRO_UOYABAUSE_CONF_OPTS += -DSH2_TRACE=False
LIBRETRO_UOYABAUSE_CONF_OPTS += -DCMAKE_C_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-gcc
LIBRETRO_UOYABAUSE_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-g++

define LIBRETRO_UOYABAUSE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/yabause/src/libretro/libyabause_libretro.so $(TARGET_DIR)/usr/lib/libretro/uoyabause_libretro.so
endef

LIBRETRO_UOYABAUSE_PRE_CONFIGURE_HOOKS = LIBRETRO_UOYABAUSE_BUILD_EXTERNAL


define LIBRETRO_UOYABAUSE_BUILD_EXTERNAL
	sed -i "s|CMAKE_C_FLAGS}|CMAKE_C_FLAGS} -DCMAKE_TOOLCHAIN_FILE=$(HOST_DIR)/share/buildroot/toolchainfile.cmake|" $(@D)/yabause/CMake/Packages/external_libchdr.cmake
	sed -i "s|CMAKE_C_FLAGS}|CMAKE_C_FLAGS} -DCMAKE_TOOLCHAIN_FILE=$(HOST_DIR)/share/buildroot/toolchainfile.cmake|" $(@D)/yabause/CMake/Packages/external_zlib.cmake
	sed -i "s|COMMAND m68kmake|COMMAND $(@D)/m68kmake_host|" $(@D)/yabause/src/musashi/CMakeLists.txt
	sed -i "s|COMMAND ./bin2c|COMMAND $(@D)/bin2c_host|" $(@D)/yabause/src/retro_arena/nanogui-sdl/CMakeLists.txt
	$(HOSTCC) $(@D)/yabause/src/retro_arena/nanogui-sdl/resources/bin2c.c -o $(@D)/bin2c_host > /dev/null 2>&1
	$(HOSTCC) $(@D)/yabause/src/musashi/m68kmake.c -o $(@D)/m68kmake_host  > /dev/null 2>&1
	sed -i 's/@GIT_SHA1@/$(shell echo "$(YABASANSHIRO_VERSION)" | cut -c1-7)/g' $(@D)/yabause/src/config.h.in

	mkdir -p $(@D)/yabause/src/libchdr-prefix/src
	cd $(@D)/yabause/src/libchdr-prefix/src && git clone https://github.com/devmiyax/libchdr.git
	mkdir -p $(@D)/yabause/src/zlib-prefix/src
	cd $(@D)/yabause/src/zlib-prefix/src && git clone https://github.com/madler/zlib
endef

$(eval $(cmake-package))
