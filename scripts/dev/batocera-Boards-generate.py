#!/usr/bin/env python3

from pathlib import Path

import yaml


def images_info_to_board_line(filepath: Path) -> None:
    data = yaml.safe_load(filepath.read_text(encoding='utf-8'))

    if not data['images']:
        raise Exception('no image found for infos file')

    board_path = filepath.relative_to('board/batocera').parent
    for image in data['images']:
        if not image['hardwares']:
            raise Exception('no hardware found for board')
        for hardware in image['hardwares']:
            print(
                f'  ["arch"=> "{image["name"]}", "path" => "{board_path}", '
                f'"family" => "{image["family"]}", "name" => "{hardware["name"]}", '
                f'"vendor" => "{hardware["vendor"]}", "type" => "{hardware["type"]}"],'
            )


images_infos = list(Path('board').rglob('image.infos'))
genimages = list(Path('board').rglob('genimage.cfg'))

# check 1-1 between image.infos and genimage.cfg
images_infos_dirs = {path.parent for path in images_infos}
genimages_dirs = {path.parent for path in genimages}

for path in sorted(images_infos_dirs - genimages_dirs):
    print(f'image.infos without genimage.cfg ({path})')
for path in sorted(genimages_dirs - images_infos_dirs):
    print(f'genimage.cfg without image.infos ({path})')

print('<?php')
print('$boards = [')
for images_info in images_infos:
    images_info_to_board_line(images_info)
print('];')
print('?>')
