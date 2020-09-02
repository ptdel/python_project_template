#!/usr/bin/env python

"""
Setup Info
==========

Returns information about properties in setup.py

"""
import json
import sys
import mock
import setuptools
from pathlib import Path

if len(sys.argv) > 1:
    prop = sys.argv[1]
else:
    prop = ""

# Setting the path to the base level of the repository.
base_dir = Path(__file__).absolute().parent.parent
sys.path.insert(0, str(base_dir))

# importing setup.py in a mocked context
with mock.patch.object(setuptools, "setup") as setup_:
    import setup

# info variable contains the property key values from setup.py
args, info = setup_.call_args

if prop is not None:
    print(json.dumps(info[prop]))
else:
    print(json.dumps(info))
