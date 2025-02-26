################################################################################
#
# python-adafruit-platformdetect
#
################################################################################
# Version: Commits on Jan 16, 2025
PYTHON_ADAFRUIT_PLATFORMDETECT_VERSION = 3.77.0
PYTHON_ADAFRUIT_PLATFORMDETECT_SOURCE = adafruit_platformdetect-$(PYTHON_ADAFRUIT_PLATFORMDETECT_VERSION).tar.gz
PYTHON_ADAFRUIT_PLATFORMDETECT_SITE = https://files.pythonhosted.org/packages/6b/4e/2b2ca031227de47e2aab6cf092b78934c9c0033a685075ddab3e0c0b55fe
PYTHON_ADAFRUIT_PLATFORMDETECT_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_PLATFORMDETECT_LICENSE = MIT
PYTHON_ADAFRUIT_PLATFORMDETECT_LICENSE_FILES = LICENSE

PYTHON_ADAFRUIT_PLATFORMDETECT_DEPENDENCIES = host-python-setuptools-scm

$(eval $(python-package))
