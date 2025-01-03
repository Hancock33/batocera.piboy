################################################################################
#
# pm_dashboard
#
################################################################################
# Version: Commits on Jan 03, 2025
PM_DASHBOARD_VERSION = 1db6227265fa4ef566946844ceb8cec2ea30482b
PM_DASHBOARD_SITE = $(call github,sunfounder,pm_dashboard,$(PM_DASHBOARD_VERSION))
PM_DASHBOARD_SETUP_TYPE = setuptools
PM_DASHBOARD_LICENSE = GPL-2.0
PM_DASHBOARD_LICENSE_FILES = LICENSE

PM_DASHBOARD_DEPENDENCIES = python-influxdb python-flask python-flask-cors influxdb

$(eval $(python-package))
