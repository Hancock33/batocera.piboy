################################################################################
#
# tic80
#
################################################################################
# Version: Commits on Feb 21, 2026
TIC80_VERSION = ae1195a9d0fbda243bf0ebd861d6876d072a979e
TIC80_SITE = https://github.com/nesbox/TIC-80.git
TIC80_SITE_METHOD=git
TIC80_GIT_SUBMODULES=YES
TIC80_LICENSE = MIT
TIC80_EMULATOR_INFO = tic80.emulator.yml
TIC80_DEPENDENCIES = libcurl libglu libglvnd pipewire sdl2

TIC80_CONF_OPTS += -DBUILD_PRO=TRUE
TIC80_CONF_OPTS += -DBUILD_SDLGPU=ON
TIC80_CONF_OPTS += -DBUILD_STATIC=ON
TIC80_CONF_OPTS += -DBUILD_TOUCH_INPUT=ON
TIC80_CONF_OPTS += -DBUILD_WITH_ALL=ON
TIC80_CONF_OPTS += -DBUILD_WITH_RUBY=OFF

$(eval $(cmake-package))
$(eval $(emulator-info-package))
