################################################################################
#
# python-pyqt5-sip
#
################################################################################
# Version: Commits on Oct 14, 2023
PYTHON_PYQT5_SIP_VERSION = 12.13.0
PYTHON_PYQT5_SIP_SOURCE = PyQt5_sip-$(PYTHON_PYQT5_SIP_VERSION).tar.gz
PYTHON_PYQT5_SIP_SITE = https://files.pythonhosted.org/packages/ee/81/fce2a475aa56c1f49707d9306b930695b6ff078c2242c9f2fd72a3214e1f

PYTHON_PYQT5_SIP_SETUP_TYPE = setuptools

$(eval $(python-package))
