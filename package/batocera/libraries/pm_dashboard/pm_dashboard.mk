################################################################################
#
# pm_dashboard
#
################################################################################
# Version: Commits on Jul 19, 2024
PM_DASHBOARD_VERSION = d1e0d5e0d91b202c9954a9b6432a1b9ff1e39c38
PM_DASHBOARD_SITE = $(call github,sunfounder,pm_dashboard,$(PM_DASHBOARD_VERSION))
PM_DASHBOARD_SETUP_TYPE = setuptools
PM_DASHBOARD_LICENSE = GPL-2.0
PM_DASHBOARD_LICENSE_FILES = LICENSE

PM_DASHBOARD_DEPENDENCIES = python-influxdb python-flask python-flask-cors influxdb

$(eval $(python-package))
