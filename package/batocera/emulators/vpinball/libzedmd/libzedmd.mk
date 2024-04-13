################################################################################
#
# libzedmd
#
################################################################################
# Version: Commits on Apr 13, 2024
LIBZEDMD_VERSION = 6395357ce400036432587b4f696a2fac14ddd21a
LIBZEDMD_SITE = $(call github,PPUC,libzedmd,$(LIBZEDMD_VERSION))
LIBZEDMD_LICENSE = GPLv3
LIBZEDMD_LICENSE_FILES = LICENSE
LIBZEDMD_DEPENDENCIES = libframeutil libserialport
LIBZEDMD_SUPPORTS_IN_SOURCE_BUILD = NO
LIBZEDMD_INSTALL_STAGING = YES

LIBZEDMD_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)

$(eval $(cmake-package))
