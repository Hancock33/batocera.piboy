################################################################################
#
# python-hidapi
#
################################################################################
# Version: Commits on Jul 23, 2024
PYTHON_HIDAPI_VERSION = 0.14.0.post2
PYTHON_HIDAPI_SOURCE = hidapi-$(PYTHON_HIDAPI_VERSION).tar.gz
PYTHON_HIDAPI_SETUP_TYPE = setuptools
PYTHON_HIDAPI_SITE = https://files.pythonhosted.org/packages/bf/6f/90c536b020a8e860f047a2839830a1ade3e1490e67336ecf489b4856eb7b
PYTHON_HIDAPI_LICENSE = GPLv3
PYTHON_HIDAPI_LICENSE_FILES = LICENSE-gpl3.txt
PYTHON_HIDAPI_DEPENDENCIES = libusb udev hidapi host-python-cython

define PYTHON_HIDAPI_UPDATE_INCLUDE_PATH
	sed -i "s+/usr/include/+$(STAGING_DIR)/usr/include/+g" $(@D)/setup.py
endef
PYTHON_HIDAPI_PRE_CONFIGURE_HOOKS += PYTHON_HIDAPI_UPDATE_INCLUDE_PATH

$(eval $(python-package))
