################################################################################
#
# pysdl2
#
################################################################################
# Version: Commits on Dec 30, 2024
PYSDL2_VERSION = 0.9.17
PYSDL2_SITE = $(call github,py-sdl,py-sdl2,$(PYSDL2_VERSION))
PYSDL2_LICENSE = CC0-1.0
PYSDL2_LICENSE_FILES = doc/copying.rst
PYSDL2_SETUP_TYPE = setuptools

PYSDL2_DEPENDENCIES = host-python-setuptools-scm

$(eval $(python-package))
