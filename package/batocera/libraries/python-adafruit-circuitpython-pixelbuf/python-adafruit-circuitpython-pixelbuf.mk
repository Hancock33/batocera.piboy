################################################################################
#
# python-adafruit-circuitpython-pixelbuf
#
################################################################################
# Version: Commits on Jan 16, 2025
PYTHON_ADAFRUIT_CIRCUITPYTHON_PIXELBUF_VERSION = 2.0.7
PYTHON_ADAFRUIT_CIRCUITPYTHON_PIXELBUF_SOURCE = adafruit_circuitpython_pixelbuf-$(PYTHON_ADAFRUIT_CIRCUITPYTHON_PIXELBUF_VERSION).tar.gz
PYTHON_ADAFRUIT_CIRCUITPYTHON_PIXELBUF_SITE = https://files.pythonhosted.org/packages/b8/82/24536026f4f0883f9d46a037e2a0934445e1a76f6d5ace30579f270f56d7
PYTHON_ADAFRUIT_CIRCUITPYTHON_PIXELBUF_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_CIRCUITPYTHON_PIXELBUF_LICENSE = MIT
PYTHON_ADAFRUIT_CIRCUITPYTHON_PIXELBUF_LICENSE_FILES = LICENSE

PYTHON_ADAFRUIT_CIRCUITPYTHON_PIXELBUF_DEPENDENCIES = host-python-setuptools-scm

$(eval $(python-package))
