################################################################################
#
# pm_dashboard
#
################################################################################
# Version: Commits on Jul 08, 2024
PM_DASHBOARD_VERSION = bea33f251758e93f2e40f430339613ba169c2c99
PM_DASHBOARD_SITE = $(call github,sunfounder,pm_dashboard,$(PM_DASHBOARD_VERSION))
PM_DASHBOARD_SETUP_TYPE = setuptools
PM_DASHBOARD_LICENSE = GPL-2.0
PM_DASHBOARD_LICENSE_FILES = LICENSE

PM_DASHBOARD_DEPENDENCIES = python-influxdb python-flask python-flask-cors influxdb

$(eval $(python-package))
