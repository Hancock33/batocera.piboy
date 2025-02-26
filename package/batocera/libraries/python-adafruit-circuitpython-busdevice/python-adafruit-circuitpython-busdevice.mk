################################################################################
#
# python-adafruit-circuitpython-busdevice
#
################################################################################
# Version: Commits on Jan 16, 2025
PYTHON_ADAFRUIT_CIRCUITPYTHON_BUSDEVICE_VERSION = 5.2.11
PYTHON_ADAFRUIT_CIRCUITPYTHON_BUSDEVICE_SOURCE = adafruit_circuitpython_busdevice-$(PYTHON_ADAFRUIT_CIRCUITPYTHON_BUSDEVICE_VERSION).tar.gz
PYTHON_ADAFRUIT_CIRCUITPYTHON_BUSDEVICE_SITE = https://files.pythonhosted.org/packages/a2/c0/f6347ab32f077413c20f55bc4b0f1592f35affd4d26753394c5ed6c36c4c
PYTHON_ADAFRUIT_CIRCUITPYTHON_BUSDEVICE_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_CIRCUITPYTHON_BUSDEVICE_LICENSE = MIT
PYTHON_ADAFRUIT_CIRCUITPYTHON_BUSDEVICE_LICENSE_FILES = LICENSE

PYTHON_ADAFRUIT_CIRCUITPYTHON_BUSDEVICE_DEPENDENCIES = host-python-setuptools-scm

$(eval $(python-package))
