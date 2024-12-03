################################################################################
#
# pm_dashboard
#
################################################################################
# Version: Commits on Dec 02, 2024
PM_DASHBOARD_VERSION = 3a21784ee0832592f1aca76513161b624280f462
PM_DASHBOARD_SITE = $(call github,sunfounder,pm_dashboard,$(PM_DASHBOARD_VERSION))
PM_DASHBOARD_SETUP_TYPE = setuptools
PM_DASHBOARD_LICENSE = GPL-2.0
PM_DASHBOARD_LICENSE_FILES = LICENSE

PM_DASHBOARD_DEPENDENCIES = python-influxdb python-flask python-flask-cors influxdb

$(eval $(python-package))
