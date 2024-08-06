################################################################################
#
# pm_auto
#
################################################################################
# Version: Commits on Aug 06, 2024
PM_AUTO_VERSION = 17a075c53247ae070be4614c9b4461398f52f2e7
PM_AUTO_SITE = $(call github,sunfounder,pm_auto,$(PM_AUTO_VERSION))
PM_AUTO_SETUP_TYPE = setuptools
PM_AUTO_LICENSE = GPL-2.0
PM_AUTO_LICENSE_FILES = LICENSE

PM_AUTO_DEPENDENCIES += python-adafruit-circuitpython-neopixel-spi
PM_AUTO_DEPENDENCIES += python-smbus2 python-psutil python-lgpio
PM_AUTO_DEPENDENCIES += python-pillow python3-gpiod python-gpiozero
PM_AUTO_DEPENDENCIES += python-adafruit-circuitpython-requests

$(eval $(python-package))
