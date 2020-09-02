import pytest
import sys
import os

#: Create relative directory context for testing.
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "../")))

from __init__ import __version__


def test_version():
    assert type(__version__) == str
