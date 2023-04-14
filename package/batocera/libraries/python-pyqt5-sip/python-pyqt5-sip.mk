################################################################################
#
# python-pyqt5-sip
#
################################################################################
PYTHON_PYQT5_SIP_VERSION = 12.12.0
PYTHON_PYQT5_SIP_SOURCE = PyQt5_sip-$(PYTHON_PYQT5_SIP_VERSION).tar.gz
PYTHON_PYQT5_SIP_SITE = https://files.pythonhosted.org/packages/2a/f1/dde13ef47f3075737af449bf833ed4d56a16bd1762c66c674c3cceacd973

PYTHON_PYQT5_SIP_SETUP_TYPE = setuptools

$(eval $(python-package))
