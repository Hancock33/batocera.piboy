################################################################################
#
# python-pyqt5-sip
#
################################################################################
PYTHON_PYQT5_SIP_VERSION = 12.11.1
PYTHON_PYQT5_SIP_SOURCE = PyQt5_sip-$(PYTHON_PYQT5_SIP_VERSION).tar.gz
PYTHON_PYQT5_SIP_SITE = https://files.pythonhosted.org/packages/d2/f4/4c3e5fc1584f5a2964cfc89bf420cfcc59aba0b1f2d08446e2b491a21ed5

PYTHON_PYQT5_SIP_SETUP_TYPE = setuptools

$(eval $(python-package))
