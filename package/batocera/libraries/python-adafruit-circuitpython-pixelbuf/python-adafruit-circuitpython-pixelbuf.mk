################################################################################
#
# python-adafruit-circuitpython-pixelbuf
#
################################################################################
# Version: Commits on Mar 27, 2026
PYTHON_ADAFRUIT_CIRCUITPYTHON_PIXELBUF_VERSION = 2.0.11
PYTHON_ADAFRUIT_CIRCUITPYTHON_PIXELBUF_SOURCE = adafruit_circuitpython_pixelbuf-$(PYTHON_ADAFRUIT_CIRCUITPYTHON_PIXELBUF_VERSION).tar.gz
PYTHON_ADAFRUIT_CIRCUITPYTHON_PIXELBUF_SITE = https://files.pythonhosted.org/packages/8a/24/d36404272865d5ba84c676f1f2507c45bc37612cd42cfa34fbfde32d1fe1
PYTHON_ADAFRUIT_CIRCUITPYTHON_PIXELBUF_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_CIRCUITPYTHON_PIXELBUF_LICENSE = MIT
PYTHON_ADAFRUIT_CIRCUITPYTHON_PIXELBUF_LICENSE_FILES = LICENSE

PYTHON_ADAFRUIT_CIRCUITPYTHON_PIXELBUF_DEPENDENCIES = host-python-setuptools-scm

$(eval $(python-package))
