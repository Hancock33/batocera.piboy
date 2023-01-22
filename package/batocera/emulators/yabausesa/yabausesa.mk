################################################################################
#
# yabausesa
#
################################################################################
# Version: Commits on Jun 18, 2022 (branch@pi4-1-9-0)
YABAUSESA_VERSION = c7618d2ecbf77b1e8188fa8af4fa1cfb34833a72
YABAUSESA_SITE = https://github.com/devmiyax/yabause.git
YABAUSESA_SITE_METHOD=git
YABAUSESA_GIT_SUBMODULES=YES
YABAUSESA_SUPPORTS_IN_SOURCE_BUILD = NO
YABAUSESA_LICENSE = GPLv2
YABAUSESA_DEPENDENCIES = sdl2 boost openal zlib
YABAUSESA_SUBDIR = yabause

YABAUSESA_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -Wno-dev
YABAUSESA_CONF_OPTS += -DCMAKE_RULE_MESSAGES=OFF
YABAUSESA_CONF_OPTS += -DYAB_PORTS=retro_arena
YABAUSESA_CONF_OPTS += -DUSE_EGL=ON
YABAUSESA_CONF_OPTS += -Dpng_STATIC_LIBRARIES=$(STAGING_DIR)/usr/lib/libpng16.a
YABAUSESA_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-Wl,--unresolved-symbols=ignore-all

ifeq ($(BR2_arm)$(BR2_aarch64),y)
	YABAUSESA_POST_EXTRACT_HOOKS += YABAUSESA_POST_EXTRACT_FIXUP_SOC
	YABAUSESA_CONF_OPTS += -DYAB_WANT_DYNAREC_DEVMIYAX=ON
	YABAUSESA_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -D_POSIX_C_SOURCE=199309L -DNDEBUG -D__RP64__"
	YABAUSESA_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CFLAGS) -D_POSIX_C_SOURCE=199309L -DNDEBUG -D__RP64__"
else ifeq ($(BR2_x86_64),y)
	YABAUSESA_POST_EXTRACT_HOOKS += YABAUSESA_POST_EXTRACT_FIXUP_SOC
	YABAUSESA_CONF_OPTS += -DYAB_WANT_DYNAREC_DEVMIYAX=OFF
	YABAUSESA_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -D_POSIX_C_SOURCE=199309L -DNDEBUG -D__PC__"
	YABAUSESA_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CFLAGS) -D_POSIX_C_SOURCE=199309L -DNDEBUG -D__PC__"
endif

ifeq ($(BR2_arm),y)
  YABAUSESA_CONF_OPTS += -DYAB_WANT_ARM7=ON
endif

define YABAUSESA_POST_EXTRACT_FIXUP_SOC
  sed -i "s|CMAKE_C_FLAGS}|CMAKE_C_FLAGS} -DCMAKE_TOOLCHAIN_FILE=$(HOST_DIR)/share/buildroot/toolchainfile.cmake|" $(@D)/yabause/CMake/Packages/external_libchdr.cmake
  sed -i "s|COMMAND m68kmake|COMMAND $(@D)/m68kmake_host|" $(@D)/yabause/src/musashi/CMakeLists.txt
  sed -i "s|COMMAND ./bin2c|COMMAND $(@D)/bin2c_host|" $(@D)/yabause/src/retro_arena/nanogui-sdl/CMakeLists.txt
  $(HOSTCC) $(@D)/yabause/src/retro_arena/nanogui-sdl/resources/bin2c.c -o $(@D)/bin2c_host
  $(HOSTCC) $(@D)/yabause/src/musashi/m68kmake.c -o $(@D)/m68kmake_host
endef

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
