################################################################################
#
# solarus-engine
#
################################################################################
# Version: Commits on Jan 06, 2023
SOLARUS_ENGINE_VERSION = 1452c51c9742299feca93028db2f86391f6a735e
SOLARUS_ENGINE_SITE = https://gitlab.com/solarus-games/solarus
SOLARUS_ENGINE_SITE_METHOD=git

SOLARUS_ENGINE_LICENSE = GPL-3.0 (code), CC-BY-SA-4.0 (Solarus logos and icons), \
	CC-BY-SA-3.0 (GUI icons)
SOLARUS_ENGINE_LICENSE_FILES = license.txt

# Install libsolarus.so
SOLARUS_ENGINE_INSTALL_STAGING = YES

SOLARUS_ENGINE_DEPENDENCIES = glm libmodplug libogg libvorbis batocera-luajit openal physfs sdl2 sdl2_image sdl2_ttf

# Disable launcher GUI (requires Qt5)
SOLARUS_ENGINE_CONF_OPTS = \
	-DSOLARUS_GUI=OFF \
	-DSOLARUS_TESTS=OFF

ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
SOLARUS_ENGINE_DEPENDENCIES += libgles
SOLARUS_ENGINE_CONF_OPTS += -DSOLARUS_GL_ES=ON
endif

$(eval $(cmake-package))
