################################################################################
#
# python-adafruit-circuitpython-busdevice
#
################################################################################
# Version: Commits on Oct 20, 2025
PYTHON_ADAFRUIT_CIRCUITPYTHON_BUSDEVICE_VERSION = 5.2.14
PYTHON_ADAFRUIT_CIRCUITPYTHON_BUSDEVICE_SOURCE = adafruit_circuitpython_busdevice-$(PYTHON_ADAFRUIT_CIRCUITPYTHON_BUSDEVICE_VERSION).tar.gz
PYTHON_ADAFRUIT_CIRCUITPYTHON_BUSDEVICE_SITE = https://files.pythonhosted.org/packages/99/70/2bb69cf3e79fc1bda7b111bcf9f90ff25ac705960eff6bd1375ffad754ff
PYTHON_ADAFRUIT_CIRCUITPYTHON_BUSDEVICE_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_CIRCUITPYTHON_BUSDEVICE_LICENSE = MIT
PYTHON_ADAFRUIT_CIRCUITPYTHON_BUSDEVICE_LICENSE_FILES = LICENSE

PYTHON_ADAFRUIT_CIRCUITPYTHON_BUSDEVICE_DEPENDENCIES = host-python-setuptools-scm

$(eval $(python-package))
