################################################################################
#
# yabasanshiro
#
################################################################################
# Version: Commits on Jun 18, 2022 (branch@pi4-1-9-0)
YABASANSHIRO_VERSION = c7618d2ecbf77b1e8188fa8af4fa1cfb34833a72
YABASANSHIRO_SITE = https://github.com/devmiyax/yabause.git
YABASANSHIRO_SITE_METHOD=git
YABASANSHIRO_GIT_SUBMODULES=YES
YABASANSHIRO_LICENSE = GPLv2
YABASANSHIRO_LICENSE_FILE = LICENSE
YABASANSHIRO_SUBDIR = yabause

YABASANSHIRO_DEPENDENCIES = sdl2 libcurl boost libglfw

YABASANSHIRO_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -L$(STAGING_DIR)/usr/lib -lpthread -ludev"

YABASANSHIRO_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
YABASANSHIRO_CONF_OPTS += -DCMAKE_SYSTEM_NAME=Linux
YABASANSHIRO_CONF_OPTS += -DCMAKE_INSTALL_PREFIX="/usr/bin/yabasanshiro"
YABASANSHIRO_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
YABASANSHIRO_CONF_OPTS += -DOpenGL_GL_PREFERENCE=GLVND
YABASANSHIRO_CONF_OPTS += -DYAB_PORTS=retro_arena
YABASANSHIRO_CONF_OPTS += -DYAB_WANT_OPENAL=OFF
YABASANSHIRO_CONF_OPTS += -DYAB_WANT_MUSASHI=ON
YABASANSHIRO_CONF_OPTS += -DYAB_WANT_C68K=FALSE
YABASANSHIRO_CONF_OPTS += -DSH2_DYNAREC=FALSE
YABASANSHIRO_CONF_OPTS += -DUSE_EGL=TRUE
YABASANSHIRO_CONF_OPTS += -Dpng_STATIC_LIBRARIES=$(STAGING_DIR)/usr/lib/libpng16.a

ifeq ($(BR2_arm)$(BR2_aarch64),y)
	YABASANSHIRO_CONF_OPTS += -DYAB_WANT_DYNAREC_DEVMIYAX=ON
	YABASANSHIRO_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -D_POSIX_C_SOURCE=199309L -DNDEBUG -D__RP64__"
	YABASANSHIRO_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CFLAGS) -D_POSIX_C_SOURCE=199309L -DNDEBUG -D__RP64__"
else ifeq ($(BR2_x86_64),y)
	YABASANSHIRO_CONF_OPTS += -DYAB_WANT_DYNAREC_DEVMIYAX=OFF
	YABASANSHIRO_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -D_POSIX_C_SOURCE=199309L -DNDEBUG -D__PC__"
	YABASANSHIRO_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CFLAGS) -D_POSIX_C_SOURCE=199309L -DNDEBUG -D__PC__"
endif

ifeq ($(BR2_arm),y)
  YABASANSHIRO_CONF_OPTS += -DYAB_WANT_ARM7=ON
endif

define YABASANSHIRO_GIT_HASH
  sed -i "s|CMAKE_C_FLAGS}|CMAKE_C_FLAGS} -DCMAKE_TOOLCHAIN_FILE=$(HOST_DIR)/share/buildroot/toolchainfile.cmake|" $(@D)/yabause/CMake/Packages/external_libchdr.cmake
  sed -i "s|COMMAND m68kmake|COMMAND $(@D)/m68kmake_host|" $(@D)/yabause/src/musashi/CMakeLists.txt
  sed -i "s|COMMAND ./bin2c|COMMAND $(@D)/bin2c_host|" $(@D)/yabause/src/retro_arena/nanogui-sdl/CMakeLists.txt
  $(HOSTCC) $(@D)/yabause/src/retro_arena/nanogui-sdl/resources/bin2c.c -o $(@D)/bin2c_host
  $(HOSTCC) $(@D)/yabause/src/musashi/m68kmake.c -o $(@D)/m68kmake_host
  sed -i 's/@GIT_SHA1@/$(shell echo "$(YABASANSHIRO_VERSION)" | cut -c1-7)/g' $(@D)/yabause/src/config.h.in
endef

define YABASANSHIRO_POST_PROCESS
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp -f $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/yabasanshiro/saturn.yabasanshiro.keys $(TARGET_DIR)/usr/share/evmapy
endef

YABASANSHIRO_PRE_CONFIGURE_HOOKS = YABASANSHIRO_GIT_HASH
YABASANSHIRO_POST_INSTALL_TARGET_HOOKS += YABASANSHIRO_POST_PROCESS

$(eval $(cmake-package))
