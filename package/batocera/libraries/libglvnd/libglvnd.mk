################################################################################
#
# LIBGLVND
#
################################################################################
# Version.: Commits on Aug 24, 2021
LIBGLVND_VERSION = dc084876b411366c3785b7584c216356169bb45e

LIBGLVND_SITE =  $(call github,NVIDIA,libglvnd,$(LIBGLVND_VERSION))
LIBGLVND_DEPENDENCIES = xlib_libXext xlib_libX11 xorgproto
LIBGLVND_INSTALL_STAGING = YES
LIBGLVND_AUTORECONF = YES

$(eval $(autotools-package))
