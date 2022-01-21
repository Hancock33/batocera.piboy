################################################################################
#
# GZDOOM
#
################################################################################
# Version.: Commits on Jan 21, 2022
GZDOOM_VERSION = 4c4fafc2c081dd1a9300424985772fdabf5cb1d1
GZDOOM_SITE = $(call github,coelckers,gzdoom,$(GZDOOM_VERSION))

GZDOOM_DEPENDENCIES = sdl2 sdl2_mixer host-zmusic zmusic
GZDOOM_LICENSE = GPL-2.0

GZDOOM_SUPPORTS_IN_SOURCE_BUILD = NO

GZDOOM_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
GZDOOM_CONF_OPTS += -DNO_GTK=ON
GZDOOM_CONF_OPTS += -DFORCE_CROSSCOMPILE=ON
GZDOOM_CONF_OPTS += -DHAVE_VULKAN=ON
GZDOOM_CONF_OPTS += -DHAVE_GLES2=ON
GZDOOM_CONF_OPTS += -DIMPORT_EXECUTABLES=$(HOST_GZDOOM_BUILDDIR)/ImportExecutables.cmake

$(eval $(cmake-package))
$(eval $(host-cmake-package))

