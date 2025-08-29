################################################################################
#
# ppsspp
#
################################################################################
# Version: Commits on Aug 29, 2025
PPSSPP_VERSION = dc05950ef8576f95b29b8e7247244129d9b9935b
PPSSPP_SITE = https://github.com/hrydgard/ppsspp.git
PPSSPP_SITE_METHOD=git
PPSSPP_GIT_SUBMODULES=YES
PPSSPP_LICENSE = GPLv2
PPSSPP_DEPENDENCIES = sdl2 sdl2_ttf libzip

PPSSPP_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
PPSSPP_CONF_OPTS += -DCMAKE_SYSTEM_NAME=Linux
PPSSPP_CONF_OPTS += -DUSE_FFMPEG=ON
PPSSPP_CONF_OPTS += -DUSING_FBDEV=ON
PPSSPP_CONF_OPTS += -DUSE_DISCORD=OFF
PPSSPP_CONF_OPTS += -DANDROID=OFF
PPSSPP_CONF_OPTS += -DWIN32=OFF
PPSSPP_CONF_OPTS += -DAPPLE=OFF
PPSSPP_CONF_OPTS += -DUNITTEST=OFF
PPSSPP_CONF_OPTS += -DSIMULATOR=OFF
PPSSPP_CONF_OPTS += -DUSING_QT_UI=OFF
PPSSPP_CONF_OPTS += -DHEADLESS=OFF
PPSSPP_CONF_OPTS += -DMOBILE_DEVICE=OFF
PPSSPP_CONF_OPTS += -DUSE_SYSTEM_FFMPEG=OFF
PPSSPP_CONF_OPTS += -DUSE_SYSTEM_LIBZIP=ON
PPSSPP_CONF_OPTS += -DUSE_SYSTEM_LIBSDL2=ON
PPSSPP_CONF_OPTS += -DUSE_SYSTEM_LIBPNG=ON
PPSSPP_CONF_OPTS += -DUSE_SYSTEM_ZSTD=ON
PPSSPP_CONF_OPTS += -DENABLE_CTEST=OFF

PPSSPP_TARGET_CFLAGS = $(TARGET_CFLAGS)
PPSSPP_TARGET_BINARY = PPSSPPSDL

# make sure to select glvnd and depends on glew / glu because of X11 desktop GL
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_ANY),y)
    PPSSPP_CONF_OPTS += -DOpenGL_GL_PREFERENCE=GLVND
    PPSSPP_DEPENDENCIES += libglew libglu
endif

# enable vulkan if we are building with it
ifeq ($(BR2_PACKAGE_BATOCERA_VULKAN),y)
    PPSSPP_CONF_OPTS += -DVULKAN=ON
    PPSSPP_CONF_OPTS += -DUSE_VULKAN_DISPLAY_KHR=ON
else
    PPSSPP_CONF_OPTS += -DVULKAN=OFF
endif
# enable x11/vulkan interface only if xorg
ifeq ($(BR2_PACKAGE_XORG7),y)
    PPSSPP_CONF_OPTS += -DUSING_X11_VULKAN=ON
else
    PPSSPP_CONF_OPTS += -DUSING_X11_VULKAN=OFF
    PPSSPP_TARGET_CFLAGS += -DEGL_NO_X11=1 -DMESA_EGL_NO_X11_HEADERS=1
endif

# arm
ifeq ($(BR2_arm),y)
    PPSSPP_CONF_OPTS += -DARM=ON
    PPSSPP_CONF_OPTS += -DARMV7=ON
    PPSSPP_CONF_OPTS += -DUSING_GLES2=ON
    PPSSPP_CONF_OPTS += -DUSING_EGL=OFF
endif

ifeq ($(BR2_aarch64),y)
    PPSSPP_CONF_OPTS += -DARM=ON
    PPSSPP_CONF_OPTS += -DARM64=ON
    PPSSPP_CONF_OPTS += -DUSING_GLES2=ON
    PPSSPP_CONF_OPTS += -DUSING_EGL=OFF
endif

# riscv
ifeq ($(BR2_riscv),y)
    PPSSPP_CONF_OPTS += -DRISCV=ON
    PPSSPP_CONF_OPTS += -DRISCV64=ON
    PPSSPP_CONF_OPTS += -DUSING_GLES2=ON
    PPSSPP_CONF_OPTS += -DUSING_EGL=OFF
endif

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64_ANY),y)
    PPSSPP_CONF_OPTS += -DX86_64=ON
endif

ifeq ($(BR2_PACKAGE_BATOCERA_WAYLAND),y)
    PPSSPP_CONF_OPTS += -DUSE_WAYLAND_WSI=ON
else
    PPSSPP_CONF_OPTS += -DUSE_WAYLAND_WSI=OFF
endif

PPSSPP_CONF_OPTS += -DCMAKE_C_FLAGS="$(PPSSPP_TARGET_CFLAGS)"
PPSSPP_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(PPSSPP_TARGET_CFLAGS)"

define PPSSPP_UPDATE_INCLUDES
	sed -i 's/unknown/"$(shell echo $(PPSSPP_VERSION) | cut -c 1-7)"/g' $(@D)/git-version.cmake
	sed -i "s+/opt/vc+$(STAGING_DIR)/usr+g" $(@D)/CMakeLists.txt
endef

define PPSSPP_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin
	$(INSTALL) -D -m 0755 $(@D)/$(PPSSPP_TARGET_BINARY) $(TARGET_DIR)/usr/bin/PPSSPP
	rm -rf $(TARGET_DIR)/usr/share/ppsspp
	mkdir -p $(TARGET_DIR)/usr/share/ppsspp
	cp -R $(@D)/assets $(TARGET_DIR)/usr/share/ppsspp/PPSSPP
	# Fix PSP font for languages like Japanese
	# (font from https://github.com/minoryorg/Noto-Sans-CJK-JP/blob/master/fonts/)
	cp -f $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/ppsspp/wqy-microhei.ttc $(TARGET_DIR)/usr/share/ppsspp/PPSSPP/Roboto-Condensed.ttf
endef

PPSSPP_PRE_CONFIGURE_HOOKS += PPSSPP_UPDATE_INCLUDES

$(eval $(cmake-package))
