################################################################################
#
# python-adafruit-circuitpython-busdevice
#
################################################################################
# Version: Commits on Oct 07, 2024
PYTHON_ADAFRUIT_CIRCUITPYTHON_BUSDEVICE_VERSION = 5.2.10
PYTHON_ADAFRUIT_CIRCUITPYTHON_BUSDEVICE_SOURCE = adafruit_circuitpython_busdevice-$(PYTHON_ADAFRUIT_CIRCUITPYTHON_BUSDEVICE_VERSION).tar.gz
PYTHON_ADAFRUIT_CIRCUITPYTHON_BUSDEVICE_SITE = https://files.pythonhosted.org/packages/af/8d/c1178adc99d2dc686874e4369482f5678af95b82a9ad22276d8c446d146c
PYTHON_ADAFRUIT_CIRCUITPYTHON_BUSDEVICE_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_CIRCUITPYTHON_BUSDEVICE_LICENSE = MIT
PYTHON_ADAFRUIT_CIRCUITPYTHON_BUSDEVICE_LICENSE_FILES = LICENSE

PYTHON_ADAFRUIT_CIRCUITPYTHON_BUSDEVICE_DEPENDENCIES = host-python-setuptools-scm

$(eval $(python-package))
