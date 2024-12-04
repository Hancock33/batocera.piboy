################################################################################
#
# pm_dashboard
#
################################################################################
# Version: Commits on Dec 04, 2024
PM_DASHBOARD_VERSION = 04925a0af89c87cc5af994309513d01798c72431
PM_DASHBOARD_SITE = $(call github,sunfounder,pm_dashboard,$(PM_DASHBOARD_VERSION))
PM_DASHBOARD_SETUP_TYPE = setuptools
PM_DASHBOARD_LICENSE = GPL-2.0
PM_DASHBOARD_LICENSE_FILES = LICENSE

PM_DASHBOARD_DEPENDENCIES = python-influxdb python-flask python-flask-cors influxdb

$(eval $(python-package))
