################################################################################
#
# tic80
#
################################################################################
# Version: Commits on Sept 24, 2026
TIC80_VERSION = ffea4e37c3d87ddadfbe08a535209b340639af2a
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
TIC80_CONF_OPTS += -DPREFER_SYSTEM_LIBRARIES=ON
TIC80_CONF_OPTS += -DPREFER_SYSTEM_SDL2=ON

ifeq ($(BR2_PACKAGE_LIBGLES),y)
TIC80_CONF_OPTS += -DBUILD_WITH_GLES=ON
endif

ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
TIC80_DEPENDENCIES += alsa-lib
endif

ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
TIC80_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
endif


$(eval $(cmake-package))
