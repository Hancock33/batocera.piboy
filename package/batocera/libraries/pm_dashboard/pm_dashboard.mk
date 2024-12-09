################################################################################
#
# pm_dashboard
#
################################################################################
# Version: Commits on Dec 09, 2024
PM_DASHBOARD_VERSION = 952be6c751c356d999159d850e0fec55f28d313f
PM_DASHBOARD_SITE = $(call github,sunfounder,pm_dashboard,$(PM_DASHBOARD_VERSION))
PM_DASHBOARD_SETUP_TYPE = setuptools
PM_DASHBOARD_LICENSE = GPL-2.0
PM_DASHBOARD_LICENSE_FILES = LICENSE

PM_DASHBOARD_DEPENDENCIES = python-influxdb python-flask python-flask-cors influxdb

$(eval $(python-package))
