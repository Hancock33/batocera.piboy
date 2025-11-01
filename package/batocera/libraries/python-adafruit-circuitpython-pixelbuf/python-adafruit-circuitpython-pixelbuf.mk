################################################################################
#
# python-adafruit-circuitpython-pixelbuf
#
################################################################################
# Version: Commits on Oct 20, 2025
PYTHON_ADAFRUIT_CIRCUITPYTHON_PIXELBUF_VERSION = 2.0.10
PYTHON_ADAFRUIT_CIRCUITPYTHON_PIXELBUF_SOURCE = adafruit_circuitpython_pixelbuf-$(PYTHON_ADAFRUIT_CIRCUITPYTHON_PIXELBUF_VERSION).tar.gz
PYTHON_ADAFRUIT_CIRCUITPYTHON_PIXELBUF_SITE = https://files.pythonhosted.org/packages/87/1e/1662a9c023affdc2e8a3f5c47dc5c4288955d4741164747d5250202bca24
PYTHON_ADAFRUIT_CIRCUITPYTHON_PIXELBUF_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_CIRCUITPYTHON_PIXELBUF_LICENSE = MIT
PYTHON_ADAFRUIT_CIRCUITPYTHON_PIXELBUF_LICENSE_FILES = LICENSE

PYTHON_ADAFRUIT_CIRCUITPYTHON_PIXELBUF_DEPENDENCIES = host-python-setuptools-scm

$(eval $(python-package))
