################################################################################
#
# cpp-ipc
#
################################################################################
# Version: Commits on Feb 02, 2026
CPP_IPC_VERSION = b6cbbc940e25ff898f09a40b107781cef6027b13
CPP_IPC_SITE = $(call github,mutouyun,cpp-ipc,$(CPP_IPC_VERSION))
CPP_IPC_LICENSE_FILES = LICENSE
CPP_IPC_SUPPORTS_IN_SOURCE_BUILD = NO
CPP_IPC_INSTALL_STAGING = YES
CPP_IPC_INSTALL_TARGET = NO

$(eval $(cmake-package))
