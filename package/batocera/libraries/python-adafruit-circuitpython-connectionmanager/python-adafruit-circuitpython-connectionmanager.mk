################################################################################
#
# python-adafruit-circuitpython-connectionmanager
#
################################################################################
# Version: Commits on Oct 07, 2024
PYTHON_ADAFRUIT_CIRCUITPYTHON_CONNECTIONMANAGER_VERSION = 3.1.2
PYTHON_ADAFRUIT_CIRCUITPYTHON_CONNECTIONMANAGER_SOURCE = adafruit_circuitpython_connectionmanager-$(PYTHON_ADAFRUIT_CIRCUITPYTHON_CONNECTIONMANAGER_VERSION).tar.gz
PYTHON_ADAFRUIT_CIRCUITPYTHON_CONNECTIONMANAGER_SITE = https://files.pythonhosted.org/packages/51/fb/83a1160eb2112abe84bf0ad41427439b253199565cc1a710d57ca30bf44c
PYTHON_ADAFRUIT_CIRCUITPYTHON_CONNECTIONMANAGER_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_CIRCUITPYTHON_CONNECTIONMANAGER_LICENSE = MIT
PYTHON_ADAFRUIT_CIRCUITPYTHON_CONNECTIONMANAGER_LICENSE_FILES = LICENSE

PYTHON_ADAFRUIT_CIRCUITPYTHON_CONNECTIONMANAGER_DEPENDENCIES = host-python-setuptools-scm

$(eval $(python-package))
