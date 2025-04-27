################################################################################
#
# pm_dashboard
#
################################################################################
# Version: Commits on Apr 25, 2025
PM_DASHBOARD_VERSION = 86a535e40be89f75e59bc0349ce9088524ca70f6
PM_DASHBOARD_SITE = $(call github,sunfounder,pm_dashboard,$(PM_DASHBOARD_VERSION))
PM_DASHBOARD_SETUP_TYPE = setuptools
PM_DASHBOARD_LICENSE = GPL-2.0
PM_DASHBOARD_LICENSE_FILES = LICENSE

PM_DASHBOARD_DEPENDENCIES = python-influxdb python-flask python-flask-cors influxdb

$(eval $(python-package))
