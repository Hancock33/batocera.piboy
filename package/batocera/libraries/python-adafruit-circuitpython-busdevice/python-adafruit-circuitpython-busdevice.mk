################################################################################
#
# python-adafruit-circuitpython-busdevice
#
################################################################################
# Version: Commits on Jan 07, 2026
PYTHON_ADAFRUIT_CIRCUITPYTHON_BUSDEVICE_VERSION = 5.2.15
PYTHON_ADAFRUIT_CIRCUITPYTHON_BUSDEVICE_SOURCE = adafruit_circuitpython_busdevice-$(PYTHON_ADAFRUIT_CIRCUITPYTHON_BUSDEVICE_VERSION).tar.gz
PYTHON_ADAFRUIT_CIRCUITPYTHON_BUSDEVICE_SITE = https://files.pythonhosted.org/packages/f8/97/f715e5171de12dfe169a3d182400295f83fe9257d48f0160e2683525633e
PYTHON_ADAFRUIT_CIRCUITPYTHON_BUSDEVICE_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_CIRCUITPYTHON_BUSDEVICE_LICENSE = MIT
PYTHON_ADAFRUIT_CIRCUITPYTHON_BUSDEVICE_LICENSE_FILES = LICENSE

PYTHON_ADAFRUIT_CIRCUITPYTHON_BUSDEVICE_DEPENDENCIES = host-python-setuptools-scm

$(eval $(python-package))
