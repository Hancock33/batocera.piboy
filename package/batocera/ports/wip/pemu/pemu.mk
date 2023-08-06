################################################################################
#
# pemu
#
################################################################################
# Version: Commits on Aug 05, 2023
PEMU_VERSION = 4067d8dc36b7f4306faebf97f0dbd54f10958f20
PEMU_SITE = https://github.com/Hancock33/pemu.git
PEMU_SITE_METHOD=git
PEMU_GIT_SUBMODULES=YES
PEMU_SUPPORTS_IN_SOURCE_BUILD = NO

PEMU_DEPENDENCIES = sdl2 sdl2_image zlib libzip freetype bzip2 libpng openal host-ninja
PEMU_LICENSE = GPL-3.0

PEMU_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -DCMAKE_EXE_LINKER_FLAGS=""
PEMU_CONF_OPTS += -DPLATFORM_LINUX=ON -DOPTION_BUILTIN_LIBCONFIG=ON
PEMU_CONF_OPTS += -DOPTION_LOADER_GLAD=OFF
PEMU_CONF_OPTS += -DOPTION_SDL2=ON
PEMU_CONF_OPTS += -DOPTION_RENDER_GLES2=ON
PEMU_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-Wl,--unresolved-symbols=ignore-all

define PEMU_INSTALL_TARGET_CMDS
	cp -a $(@D)/buildroot-build/pgen/data_romfs   /tmp/pgen
	cp -a $(@D)/buildroot-build/pgen/pgen         /tmp/pgen/
	cp -a $(@D)/buildroot-build/pnes/data_romfs   /tmp/pnes
	cp -a $(@D)/buildroot-build/pnes/pnes         /tmp/pnes/
	cp -a $(@D)/buildroot-build/psnes/data_romfs  /tmp/psnes
	cp -a $(@D)/buildroot-build/psnes/psnes       /tmp/psnes/
	cp -a $(@D)/buildroot-build/pfbneo/data_romfs  /tmp/pfbneo
	cp -a $(@D)/buildroot-build/pfbneo/pfbneo       /tmp/pfbneo/
endef

define GENERATE_DEPS
	cd $(@D)/buildroot-build &&  make pfbneo.deps
endef
PEMU_POST_CONFIGURE_HOOKS += GENERATE_DEPS

$(eval $(cmake-package))
