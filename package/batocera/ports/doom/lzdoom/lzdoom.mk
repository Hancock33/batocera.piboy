################################################################################
#
# LZDOOM
#
################################################################################
# Version: Commits on Feb 26, 2022
LZDOOM_VERSION = 4ce19a12164ebd6802b7fb2f94d700a6e736d0fb
LZDOOM_SITE = $(call github,drfrag666,gzdoom,$(LZDOOM_VERSION))

LZDOOM_DEPENDENCIES = sdl2 sdl2_mixer host-zmusic zmusic
LZDOOM_LICENSE = GPL-2.0

LZDOOM_SUPPORTS_IN_SOURCE_BUILD = NO

LZDOOM_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
LZDOOM_CONF_OPTS += -DNO_GTK=ON
LZDOOM_CONF_OPTS += -DFORCE_CROSSCOMPILE=ON
LZDOOM_CONF_OPTS += -DHAVE_VULKAN=ON
LZDOOM_CONF_OPTS += -DIMPORT_EXECUTABLES=$(HOST_LZDOOM_BUILDDIR)/ImportExecutables.cmake
LZDOOM_CONF_OPTS += -DINSTALL_SOUNDFONT_PATH="/usr/share/lzdoom"
LZDOOM_CONF_OPTS += -DINSTALL_PK3_PATH="/usr/share/lzdoom"

$(eval $(cmake-package))
$(eval $(host-cmake-package))
