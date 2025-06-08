################################################################################
#
# python-adafruit-circuitpython-pixelbuf
#
################################################################################
# Version: Commits on May 17, 2025
PYTHON_ADAFRUIT_CIRCUITPYTHON_PIXELBUF_VERSION = 2.0.8
PYTHON_ADAFRUIT_CIRCUITPYTHON_PIXELBUF_SOURCE = adafruit_circuitpython_pixelbuf-$(PYTHON_ADAFRUIT_CIRCUITPYTHON_PIXELBUF_VERSION).tar.gz
PYTHON_ADAFRUIT_CIRCUITPYTHON_PIXELBUF_SITE = https://files.pythonhosted.org/packages/67/1d/ed36cd46c5f1b71c0cb5235ec21bf744ece2355b52b7f6c88a8d035ead24
PYTHON_ADAFRUIT_CIRCUITPYTHON_PIXELBUF_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_CIRCUITPYTHON_PIXELBUF_LICENSE = MIT
PYTHON_ADAFRUIT_CIRCUITPYTHON_PIXELBUF_LICENSE_FILES = LICENSE

PYTHON_ADAFRUIT_CIRCUITPYTHON_PIXELBUF_DEPENDENCIES = host-python-setuptools-scm

$(eval $(python-package))
