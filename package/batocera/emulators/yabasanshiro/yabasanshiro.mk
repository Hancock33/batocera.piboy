################################################################################
#
# yabasanshiro
#
################################################################################
# Version: Commits on May 21, 2024
YABASANSHIRO_VERSION = bdbede9fca8ca77693f2e1c51c61d3511282585f
YABASANSHIRO_SITE = https://github.com/Hancock33/yabause.git
YABASANSHIRO_SITE_METHOD=git
YABASANSHIRO_GIT_SUBMODULES=YES
YABASANSHIRO_LICENSE = GPLv2
YABASANSHIRO_LICENSE_FILE = LICENSE
YABASANSHIRO_SUBDIR = yabause
YABASANSHIRO_CMAKE_BACKEND = make
YABASANSHIRO_INFO = yabasanshiro.emulator.yml
YABASANSHIRO_DEPENDENCIES = sdl2 boost libglfw

YABASANSHIRO_CONF_OPTS += -DCMAKE_C_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-gcc
YABASANSHIRO_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-g++
YABASANSHIRO_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
YABASANSHIRO_CONF_OPTS += -DCMAKE_INSTALL_PREFIX="/usr/bin/yabasanshiro"
YABASANSHIRO_CONF_OPTS += -Dpng_STATIC_LIBRARIES=$(STAGING_DIR)/usr/lib/libpng16.a
YABASANSHIRO_CONF_OPTS += -DUSE_EGL=ON -DUSE_OPENGL=ON
YABASANSHIRO_CONF_OPTS += -DYAB_PORTS=retro_arena

YABASANSHIRO_TARGET_CFLAGS = $(TARGET_CFLAGS) -D__RETORO_ARENA__ -Wno-implicit-function-declaration -Wno-incompatible-pointer-types -Wno-int-conversion

ifeq ($(BR2_arm)$(BR2_aarch64),y)
    YABASANSHIRO_CONF_OPTS += -DYAB_WANT_DYNAREC_DEVMIYAX=ON
    YABASANSHIRO_CONF_OPTS += -DCMAKE_C_FLAGS="$(YABASANSHIRO_TARGET_CFLAGS) -D__RP64__"
    YABASANSHIRO_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(YABASANSHIRO_TARGET_CFLAGS) -D__RP64__"
else ifeq ($(BR2_x86_64),y)
    YABASANSHIRO_CONF_OPTS += -DCMAKE_C_FLAGS="$(YABASANSHIRO_TARGET_CFLAGS) -D__PC__"
    YABASANSHIRO_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(YABASANSHIRO_TARGET_CFLAGS) -D__PC__"
    YABASANSHIRO_POST_INSTALL_TARGET_HOOKS += YABASANSHIRO_POST_PROCESS
endif

define YABASANSHIRO_GIT_HASH
	sed -i "s|CMAKE_C_FLAGS}|CMAKE_C_FLAGS} -DCMAKE_TOOLCHAIN_FILE=$(HOST_DIR)/share/buildroot/toolchainfile.cmake|" $(@D)/yabause/CMake/Packages/external_libchdr.cmake
	sed -i "s|COMMAND m68kmake|COMMAND $(@D)/m68kmake_host|" $(@D)/yabause/src/musashi/CMakeLists.txt
	sed -i "s|COMMAND ./bin2c|COMMAND $(@D)/bin2c_host|" $(@D)/yabause/src/retro_arena/nanogui-sdl/CMakeLists.txt
	$(HOSTCC) $(@D)/yabause/src/retro_arena/nanogui-sdl/resources/bin2c.c -o $(@D)/bin2c_host > /dev/null 2>&1
	$(HOSTCC) $(@D)/yabause/src/musashi/m68kmake.c -o $(@D)/m68kmake_host  > /dev/null 2>&1
	sed -i 's/@GIT_SHA1@/$(shell echo "$(YABASANSHIRO_VERSION)" | cut -c1-7)/g' $(@D)/yabause/src/config.h.in
endef

YABASANSHIRO_PRE_CONFIGURE_HOOKS = YABASANSHIRO_GIT_HASH

define YABASANSHIRO_POST_PROCESS
	cp -av $(HOST_DIR)/$(GNU_TARGET_NAME)/lib64/libquadmath.so.0.0.0 $(TARGET_DIR)/usr/bin/yabasanshiro/libquadmath.so.0
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
