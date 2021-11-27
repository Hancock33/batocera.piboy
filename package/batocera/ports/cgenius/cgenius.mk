################################################################################
#
# Commander Genius
#
################################################################################
# Version.: Commits on Nov 25, 2021
CGENIUS_VERSION = 26bd84895161167afb7b442a178aea2a384c7b53
CGENIUS_SITE = https://github.com/gerstrong/Commander-Genius

CGENIUS_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image sdl2_ttf boost libcurl
CGENIUS_SITE_METHOD=git
CGENIUS_GIT_SUBMODULES=YES

# No OpenGL ES support
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_ANY),y)
CGENIUS_CONF_OPTS += -DUSE_OPENGL=ON
else
CGENIUS_CONF_OPTS += -DUSE_OPENGL=OFF
endif

CGENIUS_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
CGENIUS_CONF_OPTS += -DBUILD_COSMOS=1
CGENIUS_CONF_OPTS += -DGAMES_SHAREDIR=/userdata/roms/cgenius

define CGENIUS_INSTALL_TARGET_SHARED_LIBRARIES
	mkdir -p $(TARGET_DIR)/usr/lib
	cp $(@D)/GsKit/base/lua/libGsKit_base_lua.so $(TARGET_DIR)/usr/lib
	cp $(@D)/GsKit/base/utils/property_tree/libGsKit_base_utils_ptree.so $(TARGET_DIR)/usr/lib
	cp $(@D)/GsKit/base/utils/libGsKit_base_utils.so $(TARGET_DIR)/usr/lib
	cp $(@D)/GsKit/base/video/libGsKit_base_video.so $(TARGET_DIR)/usr/lib
	cp $(@D)/GsKit/base/libGsKit_base.so $(TARGET_DIR)/usr/lib
	cp $(@D)/GsKit/fileio/libGsKit_fileio.so $(TARGET_DIR)/usr/lib
	cp $(@D)/GsKit/graphics/libGsKit_graphics.so $(TARGET_DIR)/usr/lib
	cp $(@D)/GsKit/widgets/libGsKit_widgets.so $(TARGET_DIR)/usr/lib
	cp $(@D)/GsKit/libGsKit.so $(TARGET_DIR)/usr/lib

	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/cgenius/cgenius.keys $(TARGET_DIR)/usr/share/evmapy
endef

CGENIUS_POST_INSTALL_TARGET_HOOKS += CGENIUS_INSTALL_TARGET_SHARED_LIBRARIES

$(eval $(cmake-package))
