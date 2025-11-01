################################################################################
#
# python-adafruit-platformdetect
#
################################################################################
# Version: Commits on Oct 14, 2025
PYTHON_ADAFRUIT_PLATFORMDETECT_VERSION = 3.84.1
PYTHON_ADAFRUIT_PLATFORMDETECT_SOURCE = adafruit_platformdetect-$(PYTHON_ADAFRUIT_PLATFORMDETECT_VERSION).tar.gz
PYTHON_ADAFRUIT_PLATFORMDETECT_SITE = https://files.pythonhosted.org/packages/1e/52/9641f5de40e9a85e69c01873eaee3e992e3d7dad32cd14fa7a8542994b1f
PYTHON_ADAFRUIT_PLATFORMDETECT_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_PLATFORMDETECT_LICENSE = MIT
PYTHON_ADAFRUIT_PLATFORMDETECT_LICENSE_FILES = LICENSE

PYTHON_ADAFRUIT_PLATFORMDETECT_DEPENDENCIES = host-python-setuptools-scm

$(eval $(python-package))
