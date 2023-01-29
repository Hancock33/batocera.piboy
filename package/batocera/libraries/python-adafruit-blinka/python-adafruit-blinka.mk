################################################################################
#
# python-adafruit-blinka
#
################################################################################

PYTHON_ADAFRUIT_BLINKA_VERSION = 8.13.0
PYTHON_ADAFRUIT_BLINKA_SOURCE = Adafruit-Blinka-$(PYTHON_ADAFRUIT_BLINKA_VERSION).tar.gz
PYTHON_ADAFRUIT_BLINKA_SITE = https://files.pythonhosted.org/packages/45/67/fa83bbff53547644131376bac7ef477899bdc60a930eec11c34f7dd52b67
PYTHON_ADAFRUIT_BLINKA_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_BLINKA_LICENSE = MIT
PYTHON_ADAFRUIT_BLINKA_LICENSE_FILES = LICENSE
PYTHON_ADAFRUIT_BLINKA_BIN_ARCH_EXCLUDE = usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/adafruit_blinka/microcontroller/bcm283x/pulseio

$(eval $(python-package))
