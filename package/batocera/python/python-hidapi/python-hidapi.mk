################################################################################
#
# python-hidapi
#
################################################################################
# Version: Commits on Dec 09, 2025
PYTHON_HIDAPI_VERSION = 0.15.0
PYTHON_HIDAPI_SOURCE = hidapi-$(PYTHON_HIDAPI_VERSION).tar.gz
PYTHON_HIDAPI_SETUP_TYPE = setuptools
PYTHON_HIDAPI_SITE = https://files.pythonhosted.org/packages/74/f6/caad9ed701fbb9223eb9e0b41a5514390769b4cb3084a2704ab69e9df0fe
PYTHON_HIDAPI_LICENSE = GPLv3
PYTHON_HIDAPI_LICENSE_FILES = LICENSE-gpl3.txt
PYTHON_HIDAPI_DEPENDENCIES = libusb udev hidapi host-python-cython

define PYTHON_HIDAPI_UPDATE_INCLUDE_PATH
	sed -i "s+/usr/include/+$(STAGING_DIR)/usr/include/+g" $(@D)/setup.py
endef
PYTHON_HIDAPI_PRE_CONFIGURE_HOOKS += PYTHON_HIDAPI_UPDATE_INCLUDE_PATH

$(eval $(python-package))
