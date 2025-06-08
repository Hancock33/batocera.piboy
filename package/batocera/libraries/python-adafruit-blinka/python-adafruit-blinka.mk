################################################################################
#
# python-adafruit-blinka
#
################################################################################
# Version: Commits on May 15, 2025
PYTHON_ADAFRUIT_BLINKA_VERSION = 8.58.1
PYTHON_ADAFRUIT_BLINKA_SOURCE = adafruit_blinka-$(PYTHON_ADAFRUIT_BLINKA_VERSION).tar.gz
PYTHON_ADAFRUIT_BLINKA_SITE = https://files.pythonhosted.org/packages/47/ea/1697fbb6bbeb9e201d11b3e7990035fe29ca18d8d58d7de74fff82cbcc63
PYTHON_ADAFRUIT_BLINKA_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_BLINKA_LICENSE = MIT
PYTHON_ADAFRUIT_BLINKA_LICENSE_FILES = LICENSE
PYTHON_ADAFRUIT_BLINKA_BIN_ARCH_EXCLUDE += usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/adafruit_blinka/microcontroller/bcm283x/pulseio
PYTHON_ADAFRUIT_BLINKA_BIN_ARCH_EXCLUDE += usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/adafruit_blinka/microcontroller/amlogic/a311d/pulseio

PYTHON_ADAFRUIT_BLINKA_DEPENDENCIES += python-adafruit-platformdetect python-numpy

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
PYTHON_ADAFRUIT_BLINKA_DEPENDENCIES += python-binho-host-adapter
endif

$(eval $(python-package))
