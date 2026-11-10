################################################################################
#
# libfreeimage
#
################################################################################
# Version: Commits on Nov 10, 2026
LIBFREEIMAGE_VERSION = d29c96999deb331181c44264e5338ec16d393c79
LIBFREEIMAGE_SITE = $(call github,toxieainc,freeimage,$(LIBFREEIMAGE_VERSION))
LIBFREEIMAGE_LICENSE = GPL-2.0 or GPL-3.0 or FreeImage Public License
LIBFREEIMAGE_LICENSE_FILES = license-gplv2.txt license-gplv3.txt license-fi.txt
LIBFREEIMAGE_CPE_ID_VENDOR = freeimage_project
LIBFREEIMAGE_CPE_ID_PRODUCT = freeimage
LIBFREEIMAGE_INSTALL_STAGING = YES

ifeq ($(BR2_aarch64),y)
    LIBFREEIMAGE_CONF_OPTS += -DARCH=arm64
endif

LIBFREEIMAGE_CONF_OPTS += -DPLATFORM=linux
LIBFREEIMAGE_CONF_OPTS += -DBUILD_STATIC=OFF

$(eval $(cmake-package))
