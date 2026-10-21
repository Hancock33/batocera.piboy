################################################################################
#
# wtype
#
################################################################################
# Version: Commits on Oct 20, 2026
WTYPE_VERSION = v0.5
WTYPE_SITE = $(call github,atx,wtype,$(WTYPE_VERSION))
WTYPE_LICENSE = MIT License
WTYPE_LICENSE_FILES = LICENSE
WTYPE_DEPENDENCIES = libxkbcommon wayland

$(eval $(meson-package))
