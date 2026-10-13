################################################################################
#
# openxr-sdk
#
################################################################################
# Version: Commits on Sept 15, 2026
OPENXR_SDK_VERSION = 3ed64d0f9bb680f24b80a085091e5c8fab38f7b7
OPENXR_SDK_SITE = $(call github,KhronosGroup,OpenXR-SDK-Source,$(OPENXR_SDK_VERSION))
OPENXR_SDK_LICENSE = Apache-2.0
OPENXR_SDK_LICENSE_FILES = LICENSE
OPENXR_SDK_DEPENDENCIES = host-python3 host-python-jinja2 xlib_libX11
OPENXR_SDK_CMAKE_BACKEND = make
OPENXR_SDK_SUPPORTS_IN_SOURCE_BUILD = NO
OPENXR_SDK_INSTALL_STAGING = YES

OPENXR_SDK_CONF_OPTS += -DPRESENTATION_BACKEND=xlib
OPENXR_SDK_CONF_OPTS += -DDYNAMIC_LOADER=ON

$(eval $(cmake-package))
