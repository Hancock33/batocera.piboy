################################################################################
#
# python-adafruit-circuitpython-neopixel-spi
#
################################################################################
# Version: Commits on Mar 27, 2026
PYTHON_ADAFRUIT_CIRCUITPYTHON_NEOPIXEL_SPI_VERSION = 1.0.15
PYTHON_ADAFRUIT_CIRCUITPYTHON_NEOPIXEL_SPI_SOURCE = adafruit_circuitpython_neopixel_spi-$(PYTHON_ADAFRUIT_CIRCUITPYTHON_NEOPIXEL_SPI_VERSION).tar.gz
PYTHON_ADAFRUIT_CIRCUITPYTHON_NEOPIXEL_SPI_SITE = https://files.pythonhosted.org/packages/f8/b3/83a5c593e5e3e8081db9bb913e767ba314be81515279cd0c4bcd17174005
PYTHON_ADAFRUIT_CIRCUITPYTHON_NEOPIXEL_SPI_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_CIRCUITPYTHON_NEOPIXEL_SPI_LICENSE = MIT
PYTHON_ADAFRUIT_CIRCUITPYTHON_NEOPIXEL_SPI_LICENSE_FILES = LICENSE
PYTHON_ADAFRUIT_CIRCUITPYTHON_NEOPIXEL_SPI_DEPENDENCIES += host-python-setuptools-scm
PYTHON_ADAFRUIT_CIRCUITPYTHON_NEOPIXEL_SPI_DEPENDENCIES += python-adafruit-circuitpython-pixelbuf
PYTHON_ADAFRUIT_CIRCUITPYTHON_NEOPIXEL_SPI_DEPENDENCIES += python-adafruit-circuitpython-busdevice

$(eval $(python-package))
