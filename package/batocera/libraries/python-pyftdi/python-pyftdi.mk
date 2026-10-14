################################################################################
#
# python-pyftdi
#
################################################################################
# Version: Commits on Jun 03, 2026
PYTHON_PYFTDI_VERSION = 0.57.2
PYTHON_PYFTDI_SITE = $(call github,eblot,pyftdi,v$(PYTHON_PYFTDI_VERSION))
PYTHON_PYFTDI_SETUP_TYPE = setuptools
PYTHON_PYFTDI_LICENSE = BSD
PYTHON_PYFTDI_LICENSE_FILES = pyftdi/doc/license.rst

$(eval $(python-package))
