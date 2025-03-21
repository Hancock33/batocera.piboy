################################################################################
#
# projectm
#
################################################################################
# Version: Commits on Jan 24, 2025
PROJECTM_VERSION = v4.1.4
PROJECTM_SITE =  $(call github,projectM-visualizer,projectm,$(PROJECTM_VERSION))
PROJECTM_LICENSE = LGPLv3
PROJECTM_AUTORECONF = YES
PROJECTM_INSTALL_STAGING = YES

PROJECTM_DEPENDENCIES = freetype toolchain
PROJECTM_CONF_OPTS = --disable-sdl --disable-qt --enable-preset-subdirs --with-pic

ifeq ($(BR2_PACKAGE_KODI20_RENDER_SYSTEM_GL),y)
PROJECTM_DEPENDENCIES += libgl
endif

ifeq ($(BR2_PACKAGE_KODI20_RENDER_SYSTEM_GLES),y)
PROJECTM_CONF_OPTS += --enable-gles
PROJECTM_DEPENDENCIES += libegl
endif

$(eval $(autotools-package))
