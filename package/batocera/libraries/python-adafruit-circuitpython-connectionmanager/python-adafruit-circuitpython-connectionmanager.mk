################################################################################
#
# python-adafruit-circuitpython-connectionmanager
#
################################################################################
# Version: Commits on Oct 20, 2025
PYTHON_ADAFRUIT_CIRCUITPYTHON_CONNECTIONMANAGER_VERSION = 3.1.6
PYTHON_ADAFRUIT_CIRCUITPYTHON_CONNECTIONMANAGER_SOURCE = adafruit_circuitpython_connectionmanager-$(PYTHON_ADAFRUIT_CIRCUITPYTHON_CONNECTIONMANAGER_VERSION).tar.gz
PYTHON_ADAFRUIT_CIRCUITPYTHON_CONNECTIONMANAGER_SITE = https://files.pythonhosted.org/packages/bc/82/69ca5ef604b0513a5f85a583d255b2d0c48042592842dfbc955b610cf3b6
PYTHON_ADAFRUIT_CIRCUITPYTHON_CONNECTIONMANAGER_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_CIRCUITPYTHON_CONNECTIONMANAGER_LICENSE = MIT
PYTHON_ADAFRUIT_CIRCUITPYTHON_CONNECTIONMANAGER_LICENSE_FILES = LICENSE

PYTHON_ADAFRUIT_CIRCUITPYTHON_CONNECTIONMANAGER_DEPENDENCIES = host-python-setuptools-scm

$(eval $(python-package))
