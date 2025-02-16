################################################################################
#
# pm_dashboard
#
################################################################################
# Version: Commits on Feb 10, 2025
PM_DASHBOARD_VERSION = 08e34c68bcf9042e38fe6e77bfe05b4b838037c3
PM_DASHBOARD_SITE = $(call github,sunfounder,pm_dashboard,$(PM_DASHBOARD_VERSION))
PM_DASHBOARD_SETUP_TYPE = setuptools
PM_DASHBOARD_LICENSE = GPL-2.0
PM_DASHBOARD_LICENSE_FILES = LICENSE

PM_DASHBOARD_DEPENDENCIES = python-influxdb python-flask python-flask-cors influxdb

$(eval $(python-package))
