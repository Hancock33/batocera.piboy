################################################################################
#
# bgfx
#
################################################################################
# Version: Commits on Feb 02, 2026
BGFX_VERSION = v1.136.9114-510
BGFX_SITE = https://github.com/bkaradzic/bgfx.cmake.git
BGFX_SITE_METHOD = git
BGFX_GIT_SUBMODULES=YES
BGFX_DEPENDENCIES =
BGFX_SUPPORTS_IN_SOURCE_BUILD = NO
BGFX_INSTALL_STAGING = YES

BGFX_PATCH_SHA = 054c6ea05099a6e283bd367033d18181bb79a135
BGFX_EXTRA_DOWNLOADS += https://github.com/vbousquet/bgfx/archive/$(BGFX_PATCH_SHA).tar.gz

BGFX_CONF_OPTS += -DBGFX_LIBRARY_TYPE=SHARED
BGFX_CONF_OPTS += -DBGFX_BUILD_TOOLS=OFF
BGFX_CONF_OPTS += -DBGFX_BUILD_EXAMPLES=OFF
BGFX_CONF_OPTS += -DBGFX_CONFIG_MULTITHREADED=ON
BGFX_CONF_OPTS += -DBGFX_CONFIG_MAX_FRAME_BUFFERS=256
BGFX_CONF_OPTS += -DBGFX_WITH_WAYLAND=OFF

define BGFX_PATCH_CMAKE
    $(TAR) -xzf $(DL_DIR)/bgfx/$(BGFX_PATCH_SHA).tar.gz -C $(@D)
    rm -rf $(@D)/bgfx
    mv $(@D)/bgfx-$(BGFX_PATCH_SHA) $(@D)/bgfx
endef

BGFX_PRE_CONFIGURE_HOOKS += BGFX_PATCH_CMAKE

$(eval $(cmake-package))
