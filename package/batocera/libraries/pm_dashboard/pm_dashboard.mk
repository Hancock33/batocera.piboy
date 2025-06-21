################################################################################
#
# pm_dashboard
#
################################################################################
# Version: Commits on Jun 06, 2025
PM_DASHBOARD_VERSION = a02f26238672aee1542debfb5797c7d29acb7cb8
PM_DASHBOARD_BRANCH = 1.2.x
PM_DASHBOARD_SITE = $(call github,sunfounder,pm_dashboard,$(PM_DASHBOARD_VERSION))
PM_DASHBOARD_SETUP_TYPE = setuptools
PM_DASHBOARD_LICENSE = GPL-2.0
PM_DASHBOARD_LICENSE_FILES = LICENSE

PM_DASHBOARD_DEPENDENCIES = python-influxdb python-flask python-flask-cors influxdb

$(eval $(python-package))
