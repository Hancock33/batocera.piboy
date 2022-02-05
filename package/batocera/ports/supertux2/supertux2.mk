################################################################################
#
# supertux
#
################################################################################

SUPERTUX2_VERSION = 0.6.3
SUPERTUX2_SITE = https://github.com/SuperTux/supertux/releases/download/v$(SUPERTUX2_VERSION)
SUPERTUX2_SOURCE = SuperTux-v$(SUPERTUX2_VERSION)-Source.tar.gz

# Supertux itself is GPL-3.0+, but it bundles a few libraries with different
# licenses (sexp-cpp, squirrel, tinygettext) which are linked statically.
SUPERTUX2_LICENSE = GPL-3.0+ (code), CC-BY-SA-2.0, CC-BY-SA-3.0, CC-BY-SA-4.0, GPL-2.0+ (images music sounds)
SUPERTUX2_LICENSE_FILES = LICENSE.txt data/AUTHORS

SUPERTUX2_DEPENDENCIES = host-pkgconf boost freetype libcurl \
	libogg libpng libvorbis openal physfs sdl2 sdl2_image zlib

SUPERTUX2_CONF_OPTS += \
	-DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -DGLEW_NO_GLU" \
	-DENABLE_BOOST_STATIC_LIBS=OFF \
	-DBUILD_DOCUMENTATION=OFF \
	-DENABLE_OPENGL=OFF \
	-DGLBINDING_ENABLED=OFF \
	-DINSTALL_SUBDIR_BIN="bin" \
	-DINSTALL_SUBDIR_SHARE="share/supertux2" \
	-DUSE_SYSTEM_PHYSFS=ON \
	-DENABLE_OPENGLES2=ON

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

define SUPERTUX2_EVMAP
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/supertux2/supertux2.keys $(TARGET_DIR)/usr/share/evmapy	
endef
SUPERTUX2_POST_INSTALL_TARGET_HOOKS += SUPERTUX2_EVMAP

$(eval $(cmake-package))
