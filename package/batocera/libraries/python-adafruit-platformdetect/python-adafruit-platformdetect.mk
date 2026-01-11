################################################################################
#
# python-adafruit-platformdetect
#
################################################################################
# Version: Commits on Dec 31, 2025
PYTHON_ADAFRUIT_PLATFORMDETECT_VERSION = 3.86.0
PYTHON_ADAFRUIT_PLATFORMDETECT_SOURCE = adafruit_platformdetect-$(PYTHON_ADAFRUIT_PLATFORMDETECT_VERSION).tar.gz
PYTHON_ADAFRUIT_PLATFORMDETECT_SITE = https://files.pythonhosted.org/packages/8c/d8/71fb0371fcf0aee9a77baba5b6b2e6aaf5ab1e9bcf1ea596f4341522e7aa
PYTHON_ADAFRUIT_PLATFORMDETECT_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_PLATFORMDETECT_LICENSE = MIT
PYTHON_ADAFRUIT_PLATFORMDETECT_LICENSE_FILES = LICENSE

PYTHON_ADAFRUIT_PLATFORMDETECT_DEPENDENCIES = host-python-setuptools-scm

$(eval $(python-package))
