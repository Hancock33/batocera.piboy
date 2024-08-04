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

YABASANSHIRO_DEPENDENCIES = sdl2 libcurl boost libglfw

#gcc-14 compile flags
YABASANSHIRO_TARGET_CFLAGS= -Wno-implicit-function-declaration -Wno-incompatible-pointer-types -Wno-int-conversion

YABASANSHIRO_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -L$(STAGING_DIR)/usr/lib -lpthread -ludev"

YABASANSHIRO_CONF_OPTS += -DCMAKE_INSTALL_PREFIX="/usr/bin/yabasanshiro"
YABASANSHIRO_CONF_OPTS += -DYAB_PORTS=retro_arena
YABASANSHIRO_CONF_OPTS += -DUSE_EGL=ON -DUSE_OPENGL=ON
YABASANSHIRO_CONF_OPTS += -Dpng_STATIC_LIBRARIES=$(STAGING_DIR)/usr/lib/libpng16.so
YABASANSHIRO_CONF_OPTS += -DCMAKE_C_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-gcc
YABASANSHIRO_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-g++

ifeq ($(BR2_arm)$(BR2_aarch64),y)
	YABASANSHIRO_CONF_OPTS += -DYAB_WANT_ARM7=ON
	YABASANSHIRO_CONF_OPTS += -DYAB_WANT_DYNAREC_DEVMIYAX=ON
	YABASANSHIRO_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) $(YABASANSHIRO_TARGET_CFLAGS) -D__RP64__"
	YABASANSHIRO_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CFLAGS) -D__RP64__"
else ifeq ($(BR2_x86_64),y)
	YABASANSHIRO_CONF_OPTS += -DYAB_WANT_DYNAREC_DEVMIYAX=OFF
	YABASANSHIRO_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) $(YABASANSHIRO_TARGET_CFLAGS) -D__PC__"
	YABASANSHIRO_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CFLAGS) -D__PC__"
endif

define YABASANSHIRO_GIT_HASH
	sed -i "s|CMAKE_C_FLAGS}|CMAKE_C_FLAGS} -DCMAKE_TOOLCHAIN_FILE=$(HOST_DIR)/share/buildroot/toolchainfile.cmake|" $(@D)/yabause/CMake/Packages/external_libchdr.cmake
	sed -i "s|COMMAND m68kmake|COMMAND $(@D)/m68kmake_host|" $(@D)/yabause/src/musashi/CMakeLists.txt
	sed -i "s|COMMAND ./bin2c|COMMAND $(@D)/bin2c_host|" $(@D)/yabause/src/retro_arena/nanogui-sdl/CMakeLists.txt
	$(HOSTCC) $(@D)/yabause/src/retro_arena/nanogui-sdl/resources/bin2c.c -o $(@D)/bin2c_host > /dev/null 2>&1
	$(HOSTCC) $(@D)/yabause/src/musashi/m68kmake.c -o $(@D)/m68kmake_host  > /dev/null 2>&1
	sed -i 's/@GIT_SHA1@/$(shell echo "$(YABASANSHIRO_VERSION)" | cut -c1-7)/g' $(@D)/yabause/src/config.h.in
endef

define YABASANSHIRO_POST_PROCESS
	$(INSTALL) -m 0755 $(@D)/yabause/src/libyabause.so -D $(TARGET_DIR)/usr/lib/libyabause.so
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp -f $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/yabasanshiro/saturn.yabasanshiro.keys $(TARGET_DIR)/usr/share/evmapy
endef

YABASANSHIRO_PRE_CONFIGURE_HOOKS = YABASANSHIRO_GIT_HASH
YABASANSHIRO_POST_INSTALL_TARGET_HOOKS += YABASANSHIRO_POST_PROCESS

$(eval $(cmake-package))
