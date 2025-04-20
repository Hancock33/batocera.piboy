################################################################################
#
# innoextract
#
################################################################################
# Version: Commits on Feb 06, 2025
INNOEXTRACT_VERSION = 6e9e34ed0876014fdb46e684103ef8c3605e382e
INNOEXTRACT_SITE = $(call github,dscharrer,innoextract,$(INNOEXTRACT_VERSION))
INNOEXTRACT_LICENSE = MIT
INNOEXTRACT_DEPENDENCIES = xz boost

$(eval $(cmake-package))
