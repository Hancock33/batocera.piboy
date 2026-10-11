################################################################################
#
# libfreeimage
#
################################################################################
# Version: Commits on Jun 17, 2025
LIBFREEIMAGE_VERSION = 6a2958b49ca060408e304fb5714fdeaab811b37d
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
