################################################################################
#
# python-smbus3
#
################################################################################
# Version: Commits on Jun 29, 2024
PYTHON_SMBUS3_VERSION = 0.5.5
PYTHON_SMBUS3_SOURCE = smbus3-$(PYTHON_SMBUS3_VERSION).tar.gz
PYTHON_SMBUS3_SITE = https://files.pythonhosted.org/packages/75/39/4b7fe2b7cfb42a39e5bb4ef2970a3befc0febbf2b5b8ef85fac04ca6dcb3
PYTHON_SMBUS3_SETUP_TYPE = setuptools
PYTHON_SMBUS3_LICENSE = MIT
PYTHON_SMBUS3_LICENSE_FILES = LICENSE
PYTHON_SMBUS3_DEPENDENCIES = host-python-cffi

$(eval $(python-package))
