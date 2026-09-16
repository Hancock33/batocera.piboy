from __future__ import annotations

import logging
import shutil
import signal
import subprocess
import time
from pathlib import Path
from typing import TYPE_CHECKING, Final

import uvloop

from batocera_common.exceptions import flatten_exception_group
from batocera_common.key_value_config import KeyValueConfig
from batocera_common.paths import BATOCERA_CONF, BATOCERA_SHARE_DIR

from .exceptions import BaseBatoceraException, BatoceraException

if TYPE_CHECKING:
    from .cli.arguments import Arguments
    from .profiler import Profiler

_logger: Final = logging.getLogger(__name__)


async def _run(args: Arguments, profiler: Profiler, /) -> int:
    from .emulator import Emulator

    async with Emulator.create(args, profiler) as emulator:
        return await emulator.run()


def _run_legacy(args: Arguments, profiler: Profiler, /) -> int:
    from configgen.emulatorlauncher import main  # pyright: ignore

    return main(args, profiler)


def launch(args: Arguments, profiler: Profiler, /) -> None:

    arch_path = Path('/usr/share/batocera/batocera.arch')
    if not arch_path.exists():
        raise BatoceraException(f'{arch_path} not found')

    arch = arch_path.read_text().splitlines()[0]

    if arch == 'x86_64':
        _logger.debug('Limiting CPU Cores for %s', arch)
        subprocess.run(['/usr/bin/batocera-cpucores', 'max'], check=True)

    batocera_version = 'UNKNOWN'
    if (version_file := BATOCERA_SHARE_DIR / 'batocera.version').exists():
        batocera_version = version_file.read_text().strip()

    _logger.info('Batocera version: %s', batocera_version)
    _logger.debug('Arguments: %s', args)

    exit_code = 0
    try:
        if KeyValueConfig(BATOCERA_CONF).get('configgen') == '1':
            _logger.debug('Using legacy configgen')
            exit_code = _run_legacy(args, profiler)
        else:
            exit_code = uvloop.run(_run(args, profiler))
    except* Exception as group:
        _logger.exception('batocera-launch exception')

        batocera_exceptions = group.subgroup(BaseBatoceraException)
        if batocera_exceptions is not None:
            base_batocera_exceptions = flatten_exception_group(batocera_exceptions)
            first_batocera_exception = next(
                (e for e in base_batocera_exceptions if isinstance(e, BatoceraException)), None
            )

            if first_batocera_exception is not None:
                exit_code = first_batocera_exception.exit_code
                Path('/tmp/launch_error.log').write_text(first_batocera_exception.args[0])
            else:
                exit_code = base_batocera_exceptions[0].exit_code

    # this seems to be required so that the gpu memory is resituated and available for ES
    time.sleep(1)

    if exit_code < 0:
        signal_number = exit_code * -1

        if signal_number < signal.NSIG:
            signal_description = signal.strsignal(signal_number)

            if signal_description and ':' not in signal_description:
                signal_description = f'{signal_description}: {signal_number}'

            _logger.debug('Emulator terminated by signal (%s)', signal_description)
            exit_code = 0

    _logger.debug('Exiting batocera-launch with status %s', exit_code)

    if args.system != 'settings':
        shutil.copy('/userdata/system/logs/batocera-launch-emulator.log', '/tmp')
        shutil.copy('/userdata/system/logs/batocera-launch.log', '/tmp')

    if arch == 'x86_64':
        _logger.debug('Limiting CPU Cores for %s', arch)
        subprocess.run(['/usr/bin/batocera-cpucores', 'min'], check=True)

    exit(exit_code)
