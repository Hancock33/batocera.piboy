#!/bin/bash

vul_pkg="glslang
SPIRV-Headers
SPIRV-Tools
Vulkan-Headers
Vulkan-Loader
Vulkan-Tools"

for i in $vul_pkg
do
    echo $i > /tmp/vulkan
	git -c 'versionsort.suffix=-' ls-remote --tags --sort='v:refname' https://github.com/KhronosGroup/$i > /tmp/vulkan
	#git -c 'versionsort.suffix=-' ls-remote --exit-code --refs --sort='version:refname' --tags https://github.com/KhronosGroup/$i '*.*.*' | tail --lines=1 | cut --delimiter='/' --fields=3
done



