################################################################################
#
# pm_dashboard
#
################################################################################
# Version: Commits on Nov 26, 2024
PM_DASHBOARD_VERSION = f67359b1c5c67db89751b786494644e38bbdc070
PM_DASHBOARD_SITE = $(call github,sunfounder,pm_dashboard,$(PM_DASHBOARD_VERSION))
PM_DASHBOARD_SETUP_TYPE = setuptools
PM_DASHBOARD_LICENSE = GPL-2.0
PM_DASHBOARD_LICENSE_FILES = LICENSE

PM_DASHBOARD_DEPENDENCIES = python-influxdb python-flask python-flask-cors influxdb

$(eval $(python-package))
