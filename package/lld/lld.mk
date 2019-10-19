################################################################################
#
# lld
#
################################################################################

LLD_VERSION = 8.0.0
LLD_SITE = https://llvm.org/releases/$(LLD_VERSION)
LLD_SOURCE = lld-$(LLD_VERSION).src.tar.xz
LLD_LICENSE = NCSA
LLD_LICENSE_FILES = LICENSE.TXT
LLD_SUPPORTS_IN_SOURCE_BUILD = NO
HOST_LLD_DEPENDENCIES = host-llvm

# GCC looks for tools in a different path from LLD's default installation path
define HOST_LLD_CREATE_SYMLINKS
	ln -sf $(HOST_DIR)/bin/lld $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/lld
	ln -sf $(HOST_DIR)/bin/lld $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/ld.lld
endef

HOST_LLD_POST_INSTALL_HOOKS += HOST_LLD_CREATE_SYMLINKS

$(eval $(host-cmake-package))
