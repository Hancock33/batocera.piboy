################################################################################
#
# python-adafruit-platformdetect
#
################################################################################
# Version: Commits on Jun 24, 2026
PYTHON_ADAFRUIT_PLATFORMDETECT_VERSION = 3.89.1
PYTHON_ADAFRUIT_PLATFORMDETECT_SOURCE = adafruit_platformdetect-$(PYTHON_ADAFRUIT_PLATFORMDETECT_VERSION).tar.gz
PYTHON_ADAFRUIT_PLATFORMDETECT_SITE = https://files.pythonhosted.org/packages/43/9b/96e46cb5eb2cf4119ff4bf0f840221704de29e2eed03976c4b291d483174
PYTHON_ADAFRUIT_PLATFORMDETECT_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_PLATFORMDETECT_LICENSE = MIT
PYTHON_ADAFRUIT_PLATFORMDETECT_LICENSE_FILES = LICENSE

PYTHON_ADAFRUIT_PLATFORMDETECT_DEPENDENCIES = host-python-setuptools-scm

$(eval $(python-package))
