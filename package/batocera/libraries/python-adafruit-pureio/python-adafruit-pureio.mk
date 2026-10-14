################################################################################
#
# python-adafruit-pureio
#
################################################################################
# Version: Commits on Sept 24, 2023
PYTHON_ADAFRUIT_PUREIO_VERSION = 1.1.12
PYTHON_ADAFRUIT_PUREIO_SOURCE = Adafruit_PureIO-$(PYTHON_ADAFRUIT_PUREIO_VERSION).tar.gz
PYTHON_ADAFRUIT_PUREIO_SITE = https://files.pythonhosted.org/packages/8a/41/f4c4ae2523ad8a9c839e1814af8db068c33266a23c2d9908512cdbef0b96
PYTHON_ADAFRUIT_PUREIO_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_PUREIO_LICENSE = MIT
PYTHON_ADAFRUIT_PUREIO_LICENSE_FILES = LICENSE

PYTHON_ADAFRUIT_PUREIO_DEPENDENCIES = host-python-setuptools-scm

$(eval $(python-package))
