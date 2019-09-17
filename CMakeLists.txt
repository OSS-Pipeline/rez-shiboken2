CMAKE_MINIMUM_REQUIRED(VERSION 3.0)

include(RezBuild)
include(RezRepository)

# We split the PySide2 version string in multiple ones.
string(REPLACE "." ";" SHIBOKEN2_VERSION_LIST ${REZ_BUILD_PROJECT_VERSION})
list(GET SHIBOKEN2_VERSION_LIST 0 SHIBOKEN2_VERSION_MAJOR)
list(GET SHIBOKEN2_VERSION_LIST 1 SHIBOKEN2_VERSION_MINOR)
list(GET SHIBOKEN2_VERSION_LIST 2 SHIBOKEN2_VERSION_PATCH)
list(GET SHIBOKEN2_VERSION_LIST 2 SHIBOKEN2_VERSION_PYTHON)

# We create Pythonless version of PySide2 to make it match with the one in the archive name.
set(SHIBOKEN2_VERSION_PYTHONLESS "${SHIBOKEN2_VERSION_MAJOR}.${SHIBOKEN2_VERSION_MINOR}.${SHIBOKEN2_VERSION_PATCH}")

# Shiboken2
rez_set_archive(
    # This is a relative path from the ${REZ_REPO_PAYLOAD_DIR} environment variable,
    # that is pointing to the root directory where we can find all the archives of the package
    # we can build, using the following hierarchy:
    # "${REZ_REPO_PAYLOAD_DIR}/project_name/archive.what.ever"
    SHIBOKEN2_URL shiboken2/shiboken2-${SHIBOKEN2_VERSION_PYTHONLESS}-${SHIBOKEN2_VERSION_PYTHONLESS}-cp27-cp27mu-manylinux1_x86_64.whl
    https://download.qt.io/official_releases/QtForPython/pyside2/shiboken2-5.12.5-5.12.5-cp27-cp27mu-manylinux1_x86_64.whl
)

# In the case of a Python pip wheel file, we do not have any archive to extract, so we can just execute our Bash
# script(s) inside an "execute_process" macro.
execute_process(
    COMMAND
    bash ${CMAKE_SOURCE_DIR}/install.sh ${CMAKE_INSTALL_PREFIX} ${SHIBOKEN2_URL}
)

# We use a bogus CMake "install" step in order to be able to properly finish
# and get out of the CMake script.
install(
    CODE
    "execute_process(
        COMMAND echo \"\n[CMAKE] Shiboken2-${REZ_BUILD_PROJECT_VERSION} PACKAGE SETUP FINISHED!\n\"
    )"
)
