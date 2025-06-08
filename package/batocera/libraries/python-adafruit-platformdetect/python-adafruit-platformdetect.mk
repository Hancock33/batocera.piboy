################################################################################
#
# python-adafruit-platformdetect
#
################################################################################
# Version: Commits on May 14, 2025
PYTHON_ADAFRUIT_PLATFORMDETECT_VERSION = 3.79.0
PYTHON_ADAFRUIT_PLATFORMDETECT_SOURCE = adafruit_platformdetect-$(PYTHON_ADAFRUIT_PLATFORMDETECT_VERSION).tar.gz
PYTHON_ADAFRUIT_PLATFORMDETECT_SITE = https://files.pythonhosted.org/packages/dc/fe/74c3cdba24f06e8748819dbbc4912e3e2193f1a900c96b659e5794dee3a8
PYTHON_ADAFRUIT_PLATFORMDETECT_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_PLATFORMDETECT_LICENSE = MIT
PYTHON_ADAFRUIT_PLATFORMDETECT_LICENSE_FILES = LICENSE

PYTHON_ADAFRUIT_PLATFORMDETECT_DEPENDENCIES = host-python-setuptools-scm

$(eval $(python-package))
