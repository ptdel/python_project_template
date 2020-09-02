"""
Project
=======
"""


def f(x: bool = True) -> bool:
    """
    Given a boolean, return the opposite.

    :param bool x: our boolean parameter.
    :return: the opposite of the param.
    :rtype: bool
    :raises TypeError: if x isn't bool.
    """
    if not type(x) == bool:
        raise TypeError("No!")
    return not x
