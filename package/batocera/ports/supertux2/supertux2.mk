################################################################################
#
# supertux2
#
################################################################################
# Version: Commits on Apr 22, 2023
SUPERTUX2_VERSION = 276fde3d127b38025d88e2a90a361d68414ffb5a
SUPERTUX2_SITE = https://github.com/SuperTux/supertux.git
SUPERTUX2_SITE_METHOD=git
SUPERTUX2_GIT_SUBMODULES=YES
SUPERTUX2_SUPPORTS_IN_SOURCE_BUILD = NO

# Supertux itself is GPL-3.0+, but it bundles a few libraries with different
# licenses (sexp-cpp, squirrel, tinygettext) which are linked statically.
SUPERTUX2_LICENSE = GPL-3.0+ (code), CC-BY-SA-2.0, CC-BY-SA-3.0, CC-BY-SA-4.0, GPL-2.0+ (images music sounds)
SUPERTUX2_LICENSE_FILES = LICENSE.txt data/AUTHORS

SUPERTUX2_DEPENDENCIES = host-pkgconf boost freetype libcurl \
	libogg libpng libvorbis openal physfs sdl2 sdl2_image zlib host-ninja

SUPERTUX2_CONF_OPTS += \
	-DCMAKE_BUILD_TYPE=Release -GNinja \
	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -DGLEW_NO_GLU" \
	-DENABLE_BOOST_STATIC_LIBS=OFF \
	-DBUILD_DOCUMENTATION=OFF \
	-DENABLE_OPENGL=ON \
	-DGLBINDING_ENABLED=OFF \
	-DINSTALL_SUBDIR_BIN="bin" \
	-DINSTALL_SUBDIR_SHARE="share/supertux2" \
	-DUSE_SYSTEM_PHYSFS=ON \
	-DGIT_VERSION="$(shell echo $(SUPERTUX2_VERSION) | cut -c 1-7)"

# Avoid incompatible posix_memalign declaration on x86 and x86_64 with
# musl.
# https://gcc.gnu.org/ml/gcc-patches/2015-05/msg01425.html
ifeq ($(BR2_TOOLCHAIN_USES_MUSL):$(BR2_i386)$(BR2_x86_64),y:y)
define SUPERTUX2_REMOVE_PEDANTIC
	$(SED) 's% -pedantic%%' $(@D)/CMakeLists.txt
	$(SED) 's%CHECK_CXX_FLAG(pedantic)%%' $(@D)/external/tinygettext/CMakeLists.txt
endef
SUPERTUX2_POST_PATCH_HOOKS += SUPERTUX2_REMOVE_PEDANTIC
endif

define SUPERTUX2_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(SUPERTUX2_BUILDDIR)
endef

define SUPERTUX2_INSTALL_TARGET_CMDS
	# install media
    mkdir -p $(TARGET_DIR)/usr/share/emulationstation/ports/supertux2
	touch $(TARGET_DIR)/usr/share/emulationstation/ports/supertux2/SuperTux2.game
	cp -a $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/supertux2/media/* $(TARGET_DIR)/usr/share/emulationstation/ports/supertux2
	ln -sf /userdata/roms/ports/supertux2 $(TARGET_DIR)/usr/share/supertux2
	# copy libraries
	cp -a $(@D)/buildroot-build/libLibPartioZip.so $(TARGET_DIR)/usr/lib
	cp -a $(@D)/buildroot-build/supertux2 $(TARGET_DIR)/usr/bin
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/supertux2/supertux2.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
