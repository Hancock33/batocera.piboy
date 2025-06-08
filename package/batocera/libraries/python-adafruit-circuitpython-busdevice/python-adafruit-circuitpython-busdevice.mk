################################################################################
#
# python-adafruit-circuitpython-busdevice
#
################################################################################
# Version: Commits on May 17, 2025
PYTHON_ADAFRUIT_CIRCUITPYTHON_BUSDEVICE_VERSION = 5.2.12
PYTHON_ADAFRUIT_CIRCUITPYTHON_BUSDEVICE_SOURCE = adafruit_circuitpython_busdevice-$(PYTHON_ADAFRUIT_CIRCUITPYTHON_BUSDEVICE_VERSION).tar.gz
PYTHON_ADAFRUIT_CIRCUITPYTHON_BUSDEVICE_SITE = https://files.pythonhosted.org/packages/18/5e/e7427ff540f17706483c0f37c9332c73fd790b53e75d6c393b8861521491
PYTHON_ADAFRUIT_CIRCUITPYTHON_BUSDEVICE_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_CIRCUITPYTHON_BUSDEVICE_LICENSE = MIT
PYTHON_ADAFRUIT_CIRCUITPYTHON_BUSDEVICE_LICENSE_FILES = LICENSE

PYTHON_ADAFRUIT_CIRCUITPYTHON_BUSDEVICE_DEPENDENCIES = host-python-setuptools-scm

$(eval $(python-package))
