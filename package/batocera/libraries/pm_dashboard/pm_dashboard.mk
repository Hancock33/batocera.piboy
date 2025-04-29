################################################################################
#
# pm_dashboard
#
################################################################################
# Version: Commits on Apr 29, 2025
PM_DASHBOARD_VERSION = bddee4dc23c4216ad95191c10d1112ebba7d7e6b
PM_DASHBOARD_SITE = $(call github,sunfounder,pm_dashboard,$(PM_DASHBOARD_VERSION))
PM_DASHBOARD_SETUP_TYPE = setuptools
PM_DASHBOARD_LICENSE = GPL-2.0
PM_DASHBOARD_LICENSE_FILES = LICENSE

PM_DASHBOARD_DEPENDENCIES = python-influxdb python-flask python-flask-cors influxdb

$(eval $(python-package))
