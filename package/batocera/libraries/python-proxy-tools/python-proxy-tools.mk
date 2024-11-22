################################################################################
#
# python-proxy-tools
#
################################################################################
# Version: Commits on May 06, 2014
PYTHON_PROXY_TOOLS_VERSION = 0.1.0
PYTHON_PROXY_TOOLS_SOURCE = proxy_tools-$(PYTHON_PROXY_TOOLS_VERSION).tar.gz
PYTHON_PROXY_TOOLS_SITE = https://files.pythonhosted.org/packages/f2/cf/77d3e19b7fabd03895caca7857ef51e4c409e0ca6b37ee6e9f7daa50b642
PYTHON_PROXY_TOOLS_SETUP_TYPE = setuptools

$(eval $(python-package))
