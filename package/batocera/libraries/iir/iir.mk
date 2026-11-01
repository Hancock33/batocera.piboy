################################################################################
#
# iir
#
################################################################################
# Version: Commits on Oct 27, 2026
IIR_VERSION = 1.11.1
IIR_SITE =  $(call github,berndporr,iir1,$(IIR_VERSION))
IIR_LICENSE = MIT
IIR_INSTALL_STAGING = YES

$(eval $(cmake-package))
