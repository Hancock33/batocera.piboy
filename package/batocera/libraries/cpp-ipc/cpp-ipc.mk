################################################################################
#
# cpp-ipc
#
################################################################################
# Version: Commits on Jan 07, 2026
CPP_IPC_VERSION = 7aa56c5f01c2d6a451a9b1362b6fb81a43cd47b0
CPP_IPC_SITE = $(call github,mutouyun,cpp-ipc,$(CPP_IPC_VERSION))
CPP_IPC_LICENSE_FILES = LICENSE
CPP_IPC_SUPPORTS_IN_SOURCE_BUILD = NO
CPP_IPC_INSTALL_STAGING = YES
CPP_IPC_INSTALL_TARGET = NO

$(eval $(cmake-package))
