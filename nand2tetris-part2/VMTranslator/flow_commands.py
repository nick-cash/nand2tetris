"""Hack assembly generators for program flow VM code."""
from instructions import emit_label, jump, d_jneq, dec_sp, d_equals_sp


def label(label):
    """Assembly for labels."""
    return [emit_label(label)]


def goto(label):
    """Assembly for unconditional gotos."""
    return [jump(label)]


def if_goto(label):
    """Assembly for conditional gotos."""
    return [
        dec_sp(),       # SP--
        d_equals_sp(),  # D=*SP
        d_jneq(label),  # D;JNE
    ]
