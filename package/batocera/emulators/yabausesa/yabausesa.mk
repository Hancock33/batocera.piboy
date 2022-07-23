################################################################################
#
# yabausesa
#
################################################################################
# Version: Commits on Jun 18, 2022
YABAUSESA_VERSION = c7618d2ecbf77b1e8188fa8af4fa1cfb34833a72
YABAUSESA_SITE = https://github.com/devmiyax/yabause.git
YABAUSESA_SITE_METHOD=git
YABAUSESA_GIT_SUBMODULES=YES
YABAUSESA_SUPPORTS_IN_SOURCE_BUILD = NO
YABAUSESA_LICENSE = GPLv2
YABAUSESA_DEPENDENCIES = sdl2 boost openal zlib
YABAUSESA_SUBDIR = yabause

define YABAUSESA_POST_EXTRACT_FIXUP
  sed -i "s|COMMAND m68kmake|COMMAND $(@D)/m68kmake_host|" $(@D)/yabause/src/musashi/CMakeLists.txt
  sed -i "s|COMMAND ./bin2c|COMMAND $(@D)/bin2c_host|" $(@D)/yabause/src/retro_arena/nanogui-sdl/CMakeLists.txt
  gcc  $(@D)/yabause/src/retro_arena/nanogui-sdl/resources/bin2c.c -o $(@D)/bin2c_host
  gcc  $(@D)/yabause/src/musashi/m68kmake.c -o $(@D)/m68kmake_host
  cp $(HOST_DIR)/share/buildroot/toolchainfile.cmake $(HOST_DIR)/share/buildroot/yabause.cmake
  echo "add_definitions( -D__RP64__ )" >> $(HOST_DIR)/share/buildroot/yabause.cmake
  echo "add_definitions( -D__RETORO_ARENA__ )" $(HOST_DIR)/share/buildroot/yabause.cmake
endef

YABAUSESA_POST_EXTRACT_HOOKS += YABAUSESA_POST_EXTRACT_FIXUP

#YABAUSESA_CONF_OPTS += -DCMAKE_VERBOSE_MAKEFILE=TRUE
YABAUSESA_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
YABAUSESA_CONF_OPTS += -DCMAKE_C_FLAGS="-O3 -pipe -D_POSIX_C_SOURCE=199309L"
YABAUSESA_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-Wl,--unresolved-symbols=ignore-all
YABAUSESA_CONF_OPTS += -DYAB_PORTS=retro_arena
YABAUSESA_CONF_OPTS += -DYAB_WANT_DYNAREC_DEVMIYAX=ON
YABAUSESA_CONF_OPTS += -DYAB_WANT_ARM7=ON
YABAUSESA_CONF_OPTS += -DUSE_EGL=TRUE
YABAUSESA_CONF_OPTS += -DYAB_WANT_VULKAN=OFF
YABAUSESA_CONF_OPTS += -DYAB_WERROR=OFF
YABAUSESA_CONF_OPTS += -DCMAKE_TOOLCHAIN_FILE=$(HOST_DIR)/share/buildroot/yabause.cmake
YABAUSESA_CONF_OPTS += -DOPENGL_INCLUDE_DIR=$(STAGING_DIR)/usr/include
YABAUSESA_CONF_OPTS += -DOPENGL_opengl_LIBRARY=$(STAGING_DIR)/usr/lib
YABAUSESA_CONF_OPTS += -DOPENGL_glx_LIBRARY=$(STAGING_DIR)/usr/lib
YABAUSESA_CONF_OPTS += -DLIBPNG_LIB_DIR=$(STAGING_DIR)/usr/lib
YABAUSESA_CONF_OPTS += -Dpng_STATIC_LIBRARIES=$(STAGING_DIR)/usr/lib/libpng16.a
YABAUSESA_CONF_OPTS += -Wno-dev

define YABAUSESA_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/yabause/buildroot-build/src/retro_arena/yabasanshiro -D $(TARGET_DIR)/usr/bin/yabausesa
	$(INSTALL) -m 0755 $(@D)/yabause/buildroot-build/src/libyabause.so -D $(TARGET_DIR)/usr/lib/libyabause.so
	mkdir -p $(TARGET_DIR)/usr/share/yabasanshiro
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/yabausesa/keymapv2.json $(TARGET_DIR)/usr/share/yabasanshiro
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/yabausesa/saturn.yabausesa.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
