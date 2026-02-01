################################################################################
#
# cpp-ipc
#
################################################################################
# Version: Commits on Jan 27, 2026
CPP_IPC_VERSION = f7a181210c2efe19cc7354e121bcba803633cb79
CPP_IPC_SITE = $(call github,mutouyun,cpp-ipc,$(CPP_IPC_VERSION))
CPP_IPC_LICENSE_FILES = LICENSE
CPP_IPC_SUPPORTS_IN_SOURCE_BUILD = NO
CPP_IPC_INSTALL_STAGING = YES
CPP_IPC_INSTALL_TARGET = NO

$(eval $(cmake-package))
