name = "shiboken2"

version = "5.12.5.py3"

authors = [
    "The Qt Company"
]

description = \
    """
    Shiboken is the Python binding generator that Qt for Python uses to create the PySide module, in other words,
    is the system we use to expose the Qt C++ API to Python.
    """

requires = [
    "cmake-3",
    "python-3.7"
]

variants = [
    ["platform-linux"]
]

build_system = "cmake"

with scope("config") as config:
    config.build_thread_count = "logical_cores"

#TODO: Use the SHA1 of the archive instead.
uuid = "shiboken2-5.12.5.py3"

def commands():
    env.PYTHONPATH.prepend("{root}")