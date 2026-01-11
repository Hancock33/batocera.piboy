################################################################################
#
# python-sysv-ipc
#
################################################################################
# Version: Commits on Jan 09, 2026
PYTHON_SYSV_IPC_VERSION = 1.2.0
PYTHON_SYSV_IPC_SOURCE = sysv_ipc-$(PYTHON_SYSV_IPC_VERSION).tar.gz
PYTHON_SYSV_IPC_SITE = https://files.pythonhosted.org/packages/f2/5e/59208c6dd05ebc6f46ce2023c4fc01ffe814a1967d21b35d312c7e6ffeae
PYTHON_SYSV_IPC_SETUP_TYPE = setuptools
PYTHON_SYSV_IPC_LICENSE = BSD
PYTHON_SYSV_IPC_LICENSE_FILES = LICENSE

$(eval $(python-package))
