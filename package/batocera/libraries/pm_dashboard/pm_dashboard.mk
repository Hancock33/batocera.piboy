################################################################################
#
# pm_dashboard
#
################################################################################
# Version: Commits on Mar 20, 2025
PM_DASHBOARD_VERSION = b2aa0dd19d7df1ef1a6ec465621cc5355035a656
PM_DASHBOARD_SITE = $(call github,sunfounder,pm_dashboard,$(PM_DASHBOARD_VERSION))
PM_DASHBOARD_SETUP_TYPE = setuptools
PM_DASHBOARD_LICENSE = GPL-2.0
PM_DASHBOARD_LICENSE_FILES = LICENSE

PM_DASHBOARD_DEPENDENCIES = python-influxdb python-flask python-flask-cors influxdb

$(eval $(python-package))
