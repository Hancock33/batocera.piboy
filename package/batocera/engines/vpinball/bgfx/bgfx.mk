################################################################################
#
# bgfx
#
################################################################################
# Version: Commits on Nov 20, 2026
BGFX_VERSION = v1.171.9648-618
BGFX_SITE = https://github.com/bkaradzic/bgfx.cmake.git
BGFX_SITE_METHOD = git
BGFX_GIT_SUBMODULES = YES
BGFX_LICENSE = CC0-1.0 (bgfx.cmake), BSD-2-Clause (bgfx, bx, bimg)
BGFX_LICENSE_FILES = LICENSE bgfx/LICENSE
BGFX_DEPENDENCIES = xlib_libX11
BGFX_SUPPORTS_IN_SOURCE_BUILD = NO
BGFX_INSTALL_STAGING = YES

BGFX_CONF_OPTS += -DBGFX_LIBRARY_TYPE=SHARED
BGFX_CONF_OPTS += -DBGFX_BUILD_TOOLS=OFF
BGFX_CONF_OPTS += -DBGFX_BUILD_EXAMPLES=OFF
BGFX_CONF_OPTS += -DBGFX_CONFIG_MULTITHREADED=ON
BGFX_CONF_OPTS += -DBGFX_CONFIG_MAX_FRAME_BUFFERS=256

HOST_BGFX_CONF_OPTS += -DBGFX_BUILD_TOOLS=ON
HOST_BGFX_CONF_OPTS += -DBGFX_BUILD_TOOLS_SHADER=ON
HOST_BGFX_CONF_OPTS += -DBGFX_BUILD_TOOLS_BIN2C=OFF
HOST_BGFX_CONF_OPTS += -DBGFX_BUILD_TOOLS_GEOMETRY=OFF
HOST_BGFX_CONF_OPTS += -DBGFX_BUILD_TOOLS_TEXTURE=OFF
HOST_BGFX_CONF_OPTS += -DBGFX_BUILD_EXAMPLES=OFF

ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
BGFX_DEPENDENCIES += libgl
else ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
BGFX_DEPENDENCIES += libgles
endif

ifeq ($(BR2_PACKAGE_WAYLAND),y)
BGFX_CONF_OPTS += -DBGFX_WITH_WAYLAND=ON
BGFX_DEPENDENCIES += wayland
else
BGFX_CONF_OPTS += -DBGFX_WITH_WAYLAND=OFF
endif

# vpinball builds bgfx (and shaderc) from vbousquet's fork, see
# platforms/config.sh in vpinball: BGFX_CMAKE_VERSION and BGFX_PATCH_SHA
BGFX_FORK_SHA = f532697ef132f46fdffe89a5caf56c7c7ba3fbd0
BGFX_EXTRA_DOWNLOADS = https://github.com/vbousquet/bgfx/archive/$(BGFX_FORK_SHA).tar.gz
HOST_BGFX_EXTRA_DOWNLOADS = $(BGFX_EXTRA_DOWNLOADS)

define BGFX_USE_FORK
	rm -rf $(@D)/bgfx
	mkdir -p $(@D)/bgfx
	$(TAR) -xzf $(BGFX_DL_DIR)/$(BGFX_FORK_SHA).tar.gz --strip-components=1 -C $(@D)/bgfx
endef
BGFX_POST_EXTRACT_HOOKS += BGFX_USE_FORK
HOST_BGFX_POST_EXTRACT_HOOKS += BGFX_USE_FORK

# vpinball links bimg_encode, which bgfx.cmake does not install
define BGFX_INSTALL_BIMG_ENCODE
	$(INSTALL) -D -m 0644 $(BGFX_BUILDDIR)/cmake/bimg/libbimg_encode.a $(STAGING_DIR)/usr/lib/libbimg_encode.a
endef
BGFX_POST_INSTALL_STAGING_HOOKS += BGFX_INSTALL_BIMG_ENCODE

$(eval $(cmake-package))
$(eval $(host-cmake-package))
