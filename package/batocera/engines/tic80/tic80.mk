################################################################################
#
# tic80
#
################################################################################
# Version: Commits on Dec 30, 2025
TIC80_VERSION = 881828910e77c799c1a6894cadc2d05a5c2f3f70
TIC80_SITE = https://github.com/nesbox/TIC-80.git
TIC80_SITE_METHOD=git
TIC80_GIT_SUBMODULES=YES
TIC80_LICENSE = MIT
TIC80_DEPENDENCIES = libcurl libglu libglvnd pipewire sdl2

TIC80_CONF_OPTS += -DBUILD_PRO=TRUE
TIC80_CONF_OPTS += -DBUILD_SDLGPU=ON
TIC80_CONF_OPTS += -DBUILD_STATIC=ON
TIC80_CONF_OPTS += -DBUILD_TOUCH_INPUT=ON
TIC80_CONF_OPTS += -DBUILD_WITH_ALL=ON
TIC80_CONF_OPTS += -DBUILD_WITH_RUBY=OFF

$(eval $(cmake-package))
