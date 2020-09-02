import pytest
import sys

from pathlib import Path

#: Create relative directory context for testing.
sys.path.insert(0, Path(__file__).parent.as_posix())

from PROJ_NAME.__main__ import f


def test_f():
    assert f(True) == False
    assert f(False) == True


def test_f_type():
    assert type(f()) == bool


def test_f_fail():
    with pytest.raises(TypeError, match=r"No!"):
        f("fail")
