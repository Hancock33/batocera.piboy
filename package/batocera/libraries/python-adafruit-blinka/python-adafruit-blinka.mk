################################################################################
#
# python-adafruit-blinka
#
################################################################################
# Version: Commits on Jun 11, 2024
PYTHON_ADAFRUIT_BLINKA_VERSION = 8.41.2
PYTHON_ADAFRUIT_BLINKA_SOURCE = adafruit_blinka-$(PYTHON_ADAFRUIT_BLINKA_VERSION).tar.gz
PYTHON_ADAFRUIT_BLINKA_SITE = https://files.pythonhosted.org/packages/f6/91/0275df60cc6e0ece3a7edf8a35cfa0b520cd0be9c07078e092aafd9d5403
PYTHON_ADAFRUIT_BLINKA_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_BLINKA_LICENSE = MIT
PYTHON_ADAFRUIT_BLINKA_LICENSE_FILES = LICENSE
PYTHON_ADAFRUIT_BLINKA_BIN_ARCH_EXCLUDE = usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/adafruit_blinka/microcontroller/bcm283x/pulseio
PYTHON_ADAFRUIT_BLINKA_BIN_ARCH_EXCLUDE += usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/adafruit_blinka/microcontroller/amlogic/a311d/pulseio

$(eval $(python-package))
