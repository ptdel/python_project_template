import os
from setuptools import setup, find_packages
from typing import List

from PROJ_NAME.__init__ import __version__

cwd = os.path.abspath(os.path.dirname(__file__))

requires: List[str] = []

setup(
    name="PROJ_NAME",
    version=__version__,
    description="PROJ_DESC",
    classifiers=[
        "Development Status :: 2 - Pre-Alpha",
        "Framework :: tox",
        "Framework :: Pytest",
        "Framework :: Sphinx",
        "Intended Audience :: Developers",
        "License :: OSI Approved :: Apache Software License",
    ],
    author="@AHEAD-MSP/developers",
    author_email="PROJ_DEV",
    url="thinkahead.com",
    keywords="PROJ_KW",
    packages=find_packages(),
    include_package_data=True,
    zip_safe=False,
    test_suite="PROJ_NAME",
    setup_requires=["pytest-runner"],
    tests_require=["pytest"],
    install_requires=requires,
)
