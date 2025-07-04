################################################################################
#
# solarus-engine
#
################################################################################
# Version: Commits on Jul 04, 2025
SOLARUS_ENGINE_VERSION = ee389455ce87a06682ed0983a06014a8193a99ab
SOLARUS_ENGINE_SITE = $(call gitlab,solarus-games,solarus,$(SOLARUS_ENGINE_VERSION))
SOLARUS_ENGINE_LICENSE = GPL-3.0 (code), CC-BY-SA-4.0 (Solarus logos and icons), CC-BY-SA-3.0 (GUI icons)
SOLARUS_ENGINE_LICENSE_FILES = license.txt
SOLARUS_ENGINE_INSTALL_STAGING = YES
SOLARUS_ENGINE_DEPENDENCIES = batocera-luajit glm libmodplug libogg libpng libvorbis openal physfs sdl2 sdl2_image sdl2_ttf

SOLARUS_ENGINE_CONF_OPTS += -DSOLARUS_GUI=OFF
SOLARUS_ENGINE_CONF_OPTS += -DSOLARUS_TESTS=OFF
SOLARUS_ENGINE_CONF_OPTS += -DSOLARUS_BASE_WRITE_DIR=/userdata/saves
SOLARUS_ENGINE_CONF_OPTS += -DSOLARUS_WRITE_DIR=solarus
SOLARUS_ENGINE_CONF_OPTS += -DSOLARUS_USE_LUAJIT=ON

ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
SOLARUS_ENGINE_DEPENDENCIES += libgles
SOLARUS_ENGINE_CONF_OPTS += -DSOLARUS_GL_ES=ON
endif

$(eval $(cmake-package))
