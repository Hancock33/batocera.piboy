################################################################################
#
# python-adafruit-platformdetect
#
################################################################################
# Version: Commits on Jun 06, 2024
PYTHON_ADAFRUIT_PLATFORMDETECT_VERSION = 3.69.0
PYTHON_ADAFRUIT_PLATFORMDETECT_SOURCE = adafruit_platformdetect-$(PYTHON_ADAFRUIT_PLATFORMDETECT_VERSION).tar.gz
PYTHON_ADAFRUIT_PLATFORMDETECT_SITE = https://files.pythonhosted.org/packages/17/32/75067ffea9503e9da528078c068075b3ec8ca030b5bd6f3dcb96e2498404
PYTHON_ADAFRUIT_PLATFORMDETECT_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_PLATFORMDETECT_LICENSE = MIT
PYTHON_ADAFRUIT_PLATFORMDETECT_LICENSE_FILES = LICENSE LICENSES/CC-BY-4.0.txt LICENSES/MIT.txt LICENSES/Unlicense.txt

$(eval $(python-package))
