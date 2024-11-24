################################################################################
#
# python-adafruit-platformdetect
#
################################################################################
# Version: Commits on Oct 07, 2024
PYTHON_ADAFRUIT_PLATFORMDETECT_VERSION = 3.75.0
PYTHON_ADAFRUIT_PLATFORMDETECT_SOURCE = adafruit_platformdetect-$(PYTHON_ADAFRUIT_PLATFORMDETECT_VERSION).tar.gz
PYTHON_ADAFRUIT_PLATFORMDETECT_SITE = https://files.pythonhosted.org/packages/1a/93/1883dea603c87caabb858759a4d737721dbd995c59dd014ef5538777f6fb
PYTHON_ADAFRUIT_PLATFORMDETECT_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_PLATFORMDETECT_LICENSE = MIT
PYTHON_ADAFRUIT_PLATFORMDETECT_LICENSE_FILES = LICENSE

$(eval $(python-package))
