################################################################################
#
# YABAUSE
#
################################################################################
# Version.: Commits on Dec 18, 2021
YABAUSE_VERSION = 7493f1d8908f4437a4c8e43aef1e67325b18f716
YABAUSE_SITE = https://github.com/devmiyax/yabause.git
YABAUSE_SITE_METHOD=git
YABAUSE_GIT_SUBMODULES=YES
YABAUSE_SUPPORTS_IN_SOURCE_BUILD = NO
YABAUSE_LICENSE = GPLv2
YABAUSE_DEPENDENCIES = sdl2 boost openal zlib
YABAUSE_SUBDIR = yabause

define YABAUSE_BUILDROOT_TOOLCHAIN
    rm -rf $(HOST_DIR)/share/buildroot/yabause_toolchainfile.cmake
    cat "$(HOST_DIR)/share/buildroot/yabause_toolchainfile.cmake" >> $(HOST_DIR)/share/buildroot/yabause_toolchainfile.cmake
    echo "set (USE_EGL True)" >> $(HOST_DIR)/share/buildroot/yabause_toolchainfile.cmake
    echo "add_definitions( -D__PI4__ )" >> $(HOST_DIR)/share/buildroot/yabause_toolchainfile.cmake
    echo "add_definitions( -D__RETORO_ARENA__ )" >> $(HOST_DIR)/share/buildroot/yabause_toolchainfile.cmake
    
    ln -s $(HOST_DIR)/share/buildroot/yabause_toolchainfile.cmake $(@D)/yabause
endef

YABAUSE_POST_EXTRACT_HOOKS += YABAUSE_BUILDROOT_TOOLCHAIN

YABAUSE_CONF_OPTS += -DYAB_PORTS=retro_arena 
YABAUSE_CONF_OPTS += -DYAB_WANT_DYNAREC_DEVMIYAX=ON 
YABAUSE_CONF_OPTS += -DYAB_WANT_ARM7=ON 
YABAUSE_CONF_OPTS += -DCMAKE_TOOLCHAIN_FILE="$(HOST_DIR)/share/buildroot/toolchainfile.cmake"
YABAUSE_CONF_OPTS += -DYAB_WANT_VULKAN=OFF
YABAUSE_CONF_OPTS += -DOPENGL_INCLUDE_DIR=${HOST_DIR}/usr/include
YABAUSE_CONF_OPTS += -DOPENGL_opengl_LIBRARY=${HOST_DIR}/usr/lib
YABAUSE_CONF_OPTS += -DLIBPNG_LIB_DIR=${HOST_DIR}/usr/lib
YABAUSE_CONF_OPTS += -Wno-dev

define YABAUSE_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/YABAUSE \
		$(TARGET_DIR)/usr/bin/YABAUSE
	# evmapy files
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/YABAUSE/ya*.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
