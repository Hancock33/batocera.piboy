################################################################################
#
# warehouse
#
################################################################################
# Version: Commits on Jun 10, 2025
WAREHOUSE_VERSION = 2.1.0
WAREHOUSE_SITE = $(call github,flattool,warehouse,$(WAREHOUSE_VERSION))
WAREHOUSE_DEPENDENCIES = appstream flatpak libgtk4
WAREHOUSE_LICENSE = GPL-3.0

$(eval $(meson-package))
