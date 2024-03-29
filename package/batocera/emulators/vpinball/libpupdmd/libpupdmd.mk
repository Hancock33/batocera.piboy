################################################################################
#
# libpupdmd
#
################################################################################
# Version: Commits on Mar 29, 2024
LIBPUPDMD_VERSION = 611ff0afcb051038cda46c8c6c68f9e9904d91ea
LIBPUPDMD_SITE = $(call github,PPUC,libpupdmd,$(LIBPUPDMD_VERSION))
LIBPUPDMD_LICENSE = GNU3
LIBPUPDMD_LICENSE_FILES = LICENSE
LIBPUPDMD_DEPENDENCIES =
LIBPUPDMD_INSTALL_STAGING = YES

LIBPUPDMD_CONF_OPTS += -DPLATFORM=linux
LIBPUPDMD_CONF_OPTS += -DARCH=x64

$(eval $(cmake-package))
