################################################################################
#
# python-adafruit-circuitpython-neopixel-spi
#
################################################################################
# Version: Commits on Jan 16, 2025
PYTHON_ADAFRUIT_CIRCUITPYTHON_NEOPIXEL_SPI_VERSION = 1.0.11
PYTHON_ADAFRUIT_CIRCUITPYTHON_NEOPIXEL_SPI_SOURCE = adafruit_circuitpython_neopixel_spi-$(PYTHON_ADAFRUIT_CIRCUITPYTHON_NEOPIXEL_SPI_VERSION).tar.gz
PYTHON_ADAFRUIT_CIRCUITPYTHON_NEOPIXEL_SPI_SITE = https://files.pythonhosted.org/packages/bb/d6/2eaa0b99fbc74f1041ad68d1913fe3b32a7d2c17d1cca6dc1b968082937e
PYTHON_ADAFRUIT_CIRCUITPYTHON_NEOPIXEL_SPI_SETUP_TYPE = setuptools
PYTHON_ADAFRUIT_CIRCUITPYTHON_NEOPIXEL_SPI_LICENSE = MIT
PYTHON_ADAFRUIT_CIRCUITPYTHON_NEOPIXEL_SPI_DEPENDENCIES += host-python-setuptools-scm
PYTHON_ADAFRUIT_CIRCUITPYTHON_NEOPIXEL_SPI_DEPENDENCIES += python-adafruit-circuitpython-pixelbuf
PYTHON_ADAFRUIT_CIRCUITPYTHON_NEOPIXEL_SPI_DEPENDENCIES += python-adafruit-circuitpython-busdevice

$(eval $(python-package))
