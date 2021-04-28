import platform
import os


__all__ = ['set_driver_path_for_browser']


ROBOT_LIBRARY_SCOPE = 'TEST SUITE'
ROBOT_LIBRARY_VERSION = 0.9


def set_driver_path_for_browser():
    os_name = platform.system().lower()
    cur_dir = os.path.dirname(os.path.abspath(__file__))
    driver_path = cur_dir.replace('libs', 'drivers')
    if os_name.startswith('Win'):
        os.environ["PATH"] += ';' + driver_path + '\\Win'
    elif os_name.startswith('Linux'):
        os.environ["PATH"] += ':' + driver_path + '/Linux'
    elif os_name.startswith('dar'):
        os.environ["PATH"] += ':' + driver_path + '/Mac'
    else:
        raise ValueError('can not find any os match with name: ' + os_name)
    print(os.getenv('PATH'))

