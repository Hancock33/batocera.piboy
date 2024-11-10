################################################################################
#
# innoextract
#
################################################################################
# Version: Commits on Aug 09, 2020
INNOEXTRACT_VERSION = 1.9
INNOEXTRACT_SITE = $(call github,dscharrer,innoextract,$(INNOEXTRACT_VERSION))
INNOEXTRACT_LICENSE = MIT
INNOEXTRACT_DEPENDENCIES = xz boost

$(eval $(cmake-package))
