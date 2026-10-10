################################################################################
#
# python-pygame2
#
################################################################################
# Version: Commits on Aug 09, 2026
PYTHON_PYGAME2_VERSION = 2.5.8
PYTHON_PYGAME2_SITE =  $(call github,pygame-community,pygame-ce,$(PYTHON_PYGAME2_VERSION))
PYTHON_PYGAME2_SETUP_TYPE = setuptools
PYTHON_PYGAME2_LICENSE = LGPL-2.1+
PYTHON_PYGAME2_LICENSE_FILES = LGPL

PYTHON_PYGAME2_DEPENDENCIES = sdl2 sdl2_image sdl2_ttf sdl2_mixer libpng jpeg host-python-cython

define PYTHON_PYGAME2_REMOVE_NOTNEEDED
	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/pygame/docs
	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/pygame/tests
endef

PYTHON_PYGAME2_POST_INSTALL_TARGET_HOOKS += PYTHON_PYGAME2_REMOVE_NOTNEEDED

ifneq ($(BR2_PACKAGE_PYTHON_PYGAME2_EXAMPLES),y)
define PYTHON_PYGAME2_REMOVE_EXAMPLES
	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/pygame/examples
endef
PYTHON_PYGAME2_POST_INSTALL_TARGET_HOOKS += PYTHON_PYGAME2_REMOVE_EXAMPLES
endif

$(eval $(meson-package))
