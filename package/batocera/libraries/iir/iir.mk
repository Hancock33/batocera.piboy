################################################################################
#
# iir
#
################################################################################
# Version: Commits on Jul 06, 2025
IIR_VERSION = 1.10.0
IIR_SITE =  $(call github,berndporr,iir1,$(IIR_VERSION))
IIR_LICENSE = MIT
IIR_INSTALL_STAGING = YES

$(eval $(cmake-package))
