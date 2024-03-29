################################################################################
#
# libpupdmd
#
################################################################################
# Version: Commits on Mar 28, 2024
LIBPUPDMD_VERSION = 63cae52ccae975fb509f7f992a5503be43b08456
LIBPUPDMD_SITE = $(call github,PPUC,libpupdmd,$(LIBPUPDMD_VERSION))
LIBPUPDMD_LICENSE = GNU3
LIBPUPDMD_LICENSE_FILES = LICENSE
LIBPUPDMD_DEPENDENCIES =
LIBPUPDMD_INSTALL_STAGING = YES

LIBPUPDMD_CONF_OPTS += -DPLATFORM=linux
LIBPUPDMD_CONF_OPTS += -DARCH=x64

$(eval $(cmake-package))
