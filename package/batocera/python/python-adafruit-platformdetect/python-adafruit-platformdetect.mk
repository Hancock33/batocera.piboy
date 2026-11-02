################################################################################
#
# python-adafruit-platformdetect
#
################################################################################
# Version: Commits on Oct 28, 2026
PYTHON_ADAFRUIT_PLATFORMDETECT_VERSION = 3.90.0
PYTHON_ADAFRUIT_PLATFORMDETECT_SOURCE = adafruit_platformdetect-$(PYTHON_ADAFRUIT_PLATFORMDETECT_VERSION).tar.gz
PYTHON_ADAFRUIT_PLATFORMDETECT_SITE = https://files.pythonhosted.org/packages/7f/54/f81a6702f970dfabca29851a0545c364fdd8b65ffd0731b479a28ef8ee5f
PYTHON_ADAFRUIT_PLATFORMDETECT_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_PLATFORMDETECT_LICENSE = MIT
PYTHON_ADAFRUIT_PLATFORMDETECT_LICENSE_FILES = LICENSE

PYTHON_ADAFRUIT_PLATFORMDETECT_DEPENDENCIES = host-python-setuptools-scm

$(eval $(python-package))
