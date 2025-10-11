################################################################################
#
# cargs
#
################################################################################
# Version: Commits on Jun 19, 2024
CARGS_VERSION = v1.2.0
CARGS_SITE = $(call github,likle,cargs,$(CARGS_VERSION))
CARGS_LICENSE = MIT
CARGS_LICENSE_FILES = LICENSE
CARGS_DEPENDENCIES =
CARGS_SUPPORTS_IN_SOURCE_BUILD = NO
CARGS_INSTALL_STAGING = YES

CARGS_CONF_OPTS += -DBUILD_SHARED_LIBS=ON

$(eval $(cmake-package))
