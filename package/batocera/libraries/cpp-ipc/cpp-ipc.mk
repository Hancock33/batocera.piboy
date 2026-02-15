################################################################################
#
# cpp-ipc
#
################################################################################
# Version: Commits on Dec 12, 2025
CPP_IPC_VERSION = v1.4.1
CPP_IPC_SITE = $(call github,mutouyun,cpp-ipc,$(CPP_IPC_VERSION))
CPP_IPC_LICENSE_FILES = LICENSE
CPP_IPC_SUPPORTS_IN_SOURCE_BUILD = NO
CPP_IPC_INSTALL_STAGING = YES
CPP_IPC_INSTALL_TARGET = NO

$(eval $(cmake-package))
