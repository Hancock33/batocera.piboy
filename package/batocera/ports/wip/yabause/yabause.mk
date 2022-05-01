################################################################################
#
# YABAUSE
#
################################################################################
# Version: Commits on Apr 09, 2022
YABAUSE_VERSION = c99ec6c37aa4dead06c8bcbf265be58e08e65652
YABAUSE_SITE = https://github.com/devmiyax/yabause.git
YABAUSE_SITE_METHOD=git
YABAUSE_GIT_SUBMODULES=YES
YABAUSE_SUPPORTS_IN_SOURCE_BUILD = NO
YABAUSE_LICENSE = GPLv2
YABAUSE_DEPENDENCIES = sdl2 boost openal zlib
YABAUSE_SUBDIR = yabause

define YABAUSE_POST_EXTRACT_FIXUP
  sed -i "s|COMMAND m68kmake|COMMAND $(@D)/m68kmake_host|" $(@D)/yabause/src/musashi/CMakeLists.txt
  sed -i "s|COMMAND ./bin2c|COMMAND $(@D)/bin2c_host|" $(@D)/yabause/src/retro_arena/nanogui-sdl/CMakeLists.txt
  gcc  $(@D)/yabause/src/retro_arena/nanogui-sdl/resources/bin2c.c -o $(@D)/bin2c_host
  gcc  $(@D)/yabause/src/musashi/m68kmake.c -o $(@D)/m68kmake_host  
  #cp $(HOST_DIR)/share/buildroot/toolchainfile.cmake $(HOST_DIR)/share/buildroot/yabause.cmake
  #echo "add_definitions( -D__N2__ )" >> /tmp/buildroot/yabause_toolchainfile.cmake
  #echo "add_definitions( -D__RETORO_ARENA__ )" >> $(HOST_DIR)/share/buildroot/yabause.cmake
endef

YABAUSE_POST_EXTRACT_HOOKS += YABAUSE_POST_EXTRACT_FIXUP

#YABAUSE_CONF_OPTS += -DCMAKE_VERBOSE_MAKEFILE=TRUE
YABAUSE_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
YABAUSE_CONF_OPTS += -DYAB_PORTS=retro_arena
YABAUSE_CONF_OPTS += -DYAB_WANT_DYNAREC_DEVMIYAX=ON
YABAUSE_CONF_OPTS += -DYAB_WANT_ARM7=ON
YABAUSE_CONF_OPTS += -DYAB_WANT_VULKAN=OFF
YABAUSE_CONF_OPTS += -DYAB_WERROR=OFF
YABAUSE_CONF_OPTS += -DCMAKE_TOOLCHAIN_FILE=$(HOST_DIR)/share/buildroot/yabause.cmake
YABAUSE_CONF_OPTS += -DOPENGL_INCLUDE_DIR=$(STAGING_DIR)/usr/include
YABAUSE_CONF_OPTS += -DOPENGL_opengl_LIBRARY=$(STAGING_DIR)/usr/lib
YABAUSE_CONF_OPTS += -DOPENGL_glx_LIBRARY=$(STAGING_DIR)/usr/lib
YABAUSE_CONF_OPTS += -DLIBPNG_LIB_DIR=$(STAGING_DIR)/usr/lib
YABAUSE_CONF_OPTS += -Dpng_STATIC_LIBRARIES=$(STAGING_DIR)/usr/lib/libpng16.a
YABAUSE_CONF_OPTS += -Wno-dev

$(eval $(cmake-package))
