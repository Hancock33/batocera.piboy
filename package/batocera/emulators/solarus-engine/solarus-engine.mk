################################################################################
#
# solarus-engine
#
################################################################################
# Version: Commits on Oct 09, 2024
SOLARUS_ENGINE_VERSION = 30b898d3348be6f71cd98d7d74254ffae6958dc0
SOLARUS_ENGINE_SITE = $(call gitlab,solarus-games,solarus,$(SOLARUS_ENGINE_VERSION))
SOLARUS_ENGINE_LICENSE = GPL-3.0 (code), CC-BY-SA-4.0 (Solarus logos and icons), CC-BY-SA-3.0 (GUI icons)
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
