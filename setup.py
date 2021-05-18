from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext

sourcefiles = ['brokap.pyx', 'SceneDrawer.cpp', 'data.cpp', 'tracker.cpp']
include_dirs = ['/usr/include/ni/']
libraries = ['GL', 'OpenNI', 'glut']

setup(
    cmdclass = {'build_ext': build_ext},
    ext_modules = [Extension("brokap", sourcefiles, language = 'c++', include_dirs = include_dirs, libraries = libraries)]
)
