################################################################################
#
# warehouse
#
################################################################################
# Version: Commits on Jan 06, 2025
WAREHOUSE_VERSION = 2.0.2
WAREHOUSE_SITE = $(call github,flattool,warehouse,$(WAREHOUSE_VERSION))
WAREHOUSE_DEPENDENCIES = appstream flatpak libgtk4
WAREHOUSE_LICENSE = GPL-3.0

$(eval $(meson-package))
