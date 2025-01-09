################################################################################
#
# pm_dashboard
#
################################################################################
# Version: Commits on Jan 08, 2025
PM_DASHBOARD_VERSION = ac55c8141bc6610709654a6ecb7382f41f4cd391
PM_DASHBOARD_SITE = $(call github,sunfounder,pm_dashboard,$(PM_DASHBOARD_VERSION))
PM_DASHBOARD_SETUP_TYPE = setuptools
PM_DASHBOARD_LICENSE = GPL-2.0
PM_DASHBOARD_LICENSE_FILES = LICENSE

PM_DASHBOARD_DEPENDENCIES = python-influxdb python-flask python-flask-cors influxdb

$(eval $(python-package))
