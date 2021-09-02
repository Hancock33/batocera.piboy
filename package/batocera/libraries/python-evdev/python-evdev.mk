################################################################################
#
# PYTHON_EVDEV
#
################################################################################
# Version.: Commits on Jan 16, 2021
PYTHON_EVDEV_VERSION = 5adc2abf1ec8a02c05c80cb1b3e34ba1d4237803
PYTHON_EVDEV_SITE =  $(call github,gvalkov,python-evdev,$(PYTHON_EVDEV_VERSION))
PYTHON_EVDEV_SETUP_TYPE = setuptools

define PYTHON_EVDEV_UPDATE_LINUX_PATH
	sed -i "s+/usr/include/linux/+$(STAGING_DIR)/usr/include/linux/+g" $(@D)/setup.py $(@D)/evdev/genecodes.py
endef
PYTHON_EVDEV_PRE_CONFIGURE_HOOKS += PYTHON_EVDEV_UPDATE_LINUX_PATH

$(eval $(python-package))
