################################################################################
#
# python-pyftdi
#
################################################################################
# Version: Commits on Jun 02, 2026
PYTHON_PYFTDI_VERSION = 25d77b02960dd42c018ac7c463b6a5500b95b5b6
PYTHON_PYFTDI_SITE = $(call github,eblot,pyftdi,v$(PYTHON_PYFTDI_VERSION))
PYTHON_PYFTDI_SETUP_TYPE = setuptools
PYTHON_PYFTDI_LICENSE = BSD
PYTHON_PYFTDI_LICENSE_FILES = pyftdi/doc/license.rst

$(eval $(python-package))
