################################################################################
#
# pm_dashboard
#
################################################################################
# Version: Commits on Dec 06, 2024
PM_DASHBOARD_VERSION = b31355471451e40673201c6d13233e2c4a816c40
PM_DASHBOARD_SITE = $(call github,sunfounder,pm_dashboard,$(PM_DASHBOARD_VERSION))
PM_DASHBOARD_SETUP_TYPE = setuptools
PM_DASHBOARD_LICENSE = GPL-2.0
PM_DASHBOARD_LICENSE_FILES = LICENSE

PM_DASHBOARD_DEPENDENCIES = python-influxdb python-flask python-flask-cors influxdb

$(eval $(python-package))
