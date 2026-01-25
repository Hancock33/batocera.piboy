################################################################################
#
# cpp-ipc
#
################################################################################
# Version: Commits on Jan 23, 2026
CPP_IPC_VERSION = 6562e40453d7e76a6488b5dd82a293a1cdc2b71f
CPP_IPC_SITE = $(call github,mutouyun,cpp-ipc,$(CPP_IPC_VERSION))
CPP_IPC_LICENSE_FILES = LICENSE
CPP_IPC_SUPPORTS_IN_SOURCE_BUILD = NO
CPP_IPC_INSTALL_STAGING = YES
CPP_IPC_INSTALL_TARGET = NO

$(eval $(cmake-package))
