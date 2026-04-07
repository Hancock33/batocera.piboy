################################################################################
#
# python-adafruit-circuitpython-connectionmanager
#
################################################################################
# Version: Commits on Mar 27, 2026
PYTHON_ADAFRUIT_CIRCUITPYTHON_CONNECTIONMANAGER_VERSION = 3.1.7
PYTHON_ADAFRUIT_CIRCUITPYTHON_CONNECTIONMANAGER_SOURCE = adafruit_circuitpython_connectionmanager-$(PYTHON_ADAFRUIT_CIRCUITPYTHON_CONNECTIONMANAGER_VERSION).tar.gz
PYTHON_ADAFRUIT_CIRCUITPYTHON_CONNECTIONMANAGER_SITE = https://files.pythonhosted.org/packages/5a/59/17e37a9f5642997d638d43623a81111e895b6ae4ed2732b6026a7ccf25fe
PYTHON_ADAFRUIT_CIRCUITPYTHON_CONNECTIONMANAGER_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_CIRCUITPYTHON_CONNECTIONMANAGER_LICENSE = MIT
PYTHON_ADAFRUIT_CIRCUITPYTHON_CONNECTIONMANAGER_LICENSE_FILES = LICENSE

PYTHON_ADAFRUIT_CIRCUITPYTHON_CONNECTIONMANAGER_DEPENDENCIES = host-python-setuptools-scm

$(eval $(python-package))
