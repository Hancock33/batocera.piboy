################################################################################
#
# miniz
#
################################################################################
# Version: Commits on Feb 03, 2026
MINIZ_VERSION = 3.1.1
MINIZ_SITE = $(call github,richgel999,miniz,$(MINIZ_VERSION))
MINIZ_LICENSE = GPL-2
MINIZ_SUPPORTS_IN_SOURCE_BUILD = NO
MINIZ_INSTALL_STAGING = YES

MINIZ_CONF_OPTS += -DBUILD_EXAMPLES=OFF
MINIZ_CONF_OPTS += -DBUILD_SHARED_LIBS=ON

$(eval $(cmake-package))
