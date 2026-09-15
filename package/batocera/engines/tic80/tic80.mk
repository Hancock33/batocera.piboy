################################################################################
#
# tic80
#
################################################################################
# Version: Commits on Sept 15, 2026
TIC80_VERSION = af4d6acbf9087f5ce39ea07683e11b0f895afc4b
TIC80_SITE = https://github.com/nesbox/TIC-80.git
TIC80_SITE_METHOD=git
TIC80_GIT_SUBMODULES=YES
TIC80_LICENSE = MIT
TIC80_EMULATOR_INFO = tic80.emulator.yml
TIC80_DEPENDENCIES = libcurl libglu libglvnd pipewire sdl2

TIC80_TARGET_CFLAGS = $(TARGET_CFLAGS) -Wno-incompatible-pointer-types

TIC80_CONF_OPTS += -DBUILD_PRO=TRUE
TIC80_CONF_OPTS += -DBUILD_SDLGPU=ON
TIC80_CONF_OPTS += -DBUILD_STATIC=ON
TIC80_CONF_OPTS += -DBUILD_TOUCH_INPUT=ON
TIC80_CONF_OPTS += -DBUILD_WITH_ALL=ON
TIC80_CONF_OPTS += -DBUILD_WITH_RUBY=OFF
TIC80_CONF_OPTS += -DCMAKE_C_FLAGS="$(TIC80_TARGET_CFLAGS)"

$(eval $(cmake-package))
$(eval $(emulator-info-package))
