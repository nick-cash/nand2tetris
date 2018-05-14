"""Hack assembly generators for memory map VM code."""
from arithmetic_commands import update_sp
from instructions import set_d


def push(segment, index):
    """Assembly for push commands."""
    return PUSH_SEGMENT_MAP[segment](index)


@update_sp
def push_constant(index):
    """Assembly for push constant commands."""
    return [
        set_d(index),   # D=index
    ]


def pop(segment, index):
    """Assembly for pop commands."""
    pass


PUSH_SEGMENT_MAP = {
    "static": None,
    "local": None,
    "argument": None,
    "this": None,
    "that": None,
    "temp": None,
    "constant": push_constant,
}

POP_SEGMENT_MAP = {
    "static": None,
    "local": None,
    "argument": None,
    "this": None,
    "that": None,
    "temp": None,
    "constant": None,
}
