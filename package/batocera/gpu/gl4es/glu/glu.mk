################################################################################
#
# libglu
#
################################################################################
# Version.: Commits on Apr 15, 2018
GLU_VERSION = 2fed2bda2b725d2b9e32c435b48d5141cc95827f
GLU_SITE = $(call github,ptitSeb,GLU,$(GLU_VERSION))
GLU__DEPENDENCIES = gl4es
GLU_LICENSE = SGI-B-2.0

$(eval $(autotools-package))
