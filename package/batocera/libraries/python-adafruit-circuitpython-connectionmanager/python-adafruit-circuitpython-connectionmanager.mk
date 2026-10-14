################################################################################
#
# python-adafruit-circuitpython-connectionmanager
#
################################################################################
# Version: Commits on Apr 23, 2026
PYTHON_ADAFRUIT_CIRCUITPYTHON_CONNECTIONMANAGER_VERSION = 3.1.8
PYTHON_ADAFRUIT_CIRCUITPYTHON_CONNECTIONMANAGER_SOURCE = adafruit_circuitpython_connectionmanager-$(PYTHON_ADAFRUIT_CIRCUITPYTHON_CONNECTIONMANAGER_VERSION).tar.gz
PYTHON_ADAFRUIT_CIRCUITPYTHON_CONNECTIONMANAGER_SITE = https://files.pythonhosted.org/packages/a0/29/1653838bc0e5c6119fa2b03edb58b592a2475e7cf99810064a99e5eb8994
PYTHON_ADAFRUIT_CIRCUITPYTHON_CONNECTIONMANAGER_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_CIRCUITPYTHON_CONNECTIONMANAGER_LICENSE = MIT
PYTHON_ADAFRUIT_CIRCUITPYTHON_CONNECTIONMANAGER_LICENSE_FILES = LICENSE

PYTHON_ADAFRUIT_CIRCUITPYTHON_CONNECTIONMANAGER_DEPENDENCIES = host-python-setuptools-scm

$(eval $(python-package))
