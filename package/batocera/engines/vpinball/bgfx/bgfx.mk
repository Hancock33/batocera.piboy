################################################################################
#
# bgfx
#
################################################################################
# Version: Commits on Oct 09, 2026
BGFX_VERSION = v1.164.9539-582
BGFX_SITE = https://github.com/bkaradzic/bgfx.cmake.git
BGFX_SITE_METHOD = git
BGFX_GIT_SUBMODULES = YES
BGFX_LICENSE = CC0 1.0 Universal
BGFX_LICENSE_FILES = LICENSE
BGFX_DEPENDENCIES = xlib_libX11
BGFX_SUPPORTS_IN_SOURCE_BUILD = NO
BGFX_INSTALL_STAGING = YES


BGFX_CONF_OPTS += -DBGFX_LIBRARY_TYPE=SHARED
BGFX_CONF_OPTS += -DBGFX_BUILD_TOOLS=OFF
BGFX_CONF_OPTS += -DBGFX_BUILD_EXAMPLES=OFF
BGFX_CONF_OPTS += -DBGFX_CONFIG_MULTITHREADED=ON
BGFX_CONF_OPTS += -DBGFX_CONFIG_MAX_FRAME_BUFFERS=256

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

BGFX_PATCH_SHA = 9fb47b3390d764c22dbb823576c7cc0e46491fb0
BGFX_EXTRA_DOWNLOADS += https://github.com/vbousquet/bgfx/archive/$(BGFX_PATCH_SHA).tar.gz


define BGFX_PATCH_CMAKE
	rm -rf $(@D)/bgfx
	$(TAR) -xzf $(DL_DIR)/bgfx/$(BGFX_PATCH_SHA).tar.gz -C $(@D)
	mv $(@D)/bgfx-$(BGFX_PATCH_SHA) $(@D)/bgfx
endef

BGFX_PRE_CONFIGURE_HOOKS += BGFX_PATCH_CMAKE

define BGFX_INSTALL_BIMG_ENCODE
	$(INSTALL) -D -m 0644 $(BGFX_BUILDDIR)/cmake/bimg/libbimg_encode.a $(STAGING_DIR)/usr/lib/libbimg_encode.a
endef
BGFX_POST_INSTALL_STAGING_HOOKS += BGFX_INSTALL_BIMG_ENCODE

$(eval $(cmake-package))
