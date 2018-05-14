"""Methods that generate Hack assembly from provided VM code."""

from collections import defaultdict
from instructions import dec_sp, inc_sp, set_d, d_equals_sp, \
    a_equals_sp, sp_equals_d, d_equals_a_minus_d, d_equals_d_plus_a, \
    d_equals_neg_d, jump, d_jeq


label_counter = defaultdict(int)

TRUE = -1   # 0xFFFF
FALSE = 0   # 0x0000


def binary(function):
    """Automate stack handling for binary comands. A=X, D=Y."""
    def wrapper(*args, **kwargs):
        return [
            dec_sp(),               # SP--
            d_equals_sp(),          # D=*SP
            dec_sp(),               # SP--
            a_equals_sp(),          # A=*SP
        ] + function(*args, **kwargs) + [
            sp_equals_d(),          # *SP=D
            inc_sp(),               # SP++
        ]
    return wrapper


def unary(function):
    """Automate stack handling for unary comands. Y=D."""
    def wrapper(*args, **kwargs):
        return [
            dec_sp(),               # SP--
            d_equals_sp(),          # D=*SP
        ] + function(*args, **kwargs) + [
            sp_equals_d(),          # *SP=D
            inc_sp(),               # SP++
        ]
    return wrapper


@binary
def add():
    """Assembly for add commands."""
    return [d_equals_d_plus_a()]    # D=D+A


@binary
def sub():
    """Assembly for sub commands."""
    return [d_equals_a_minus_d()]   # D=A-D


@unary
def neg():
    """Assembly for neg commands."""
    return [d_equals_neg_d()]   # D=-D


@binary
def eq():
    """Assembly for eq commands."""
    counter = label_counter["eq"]
    label_counter["eq"] += 1

    true_label = "(EQ_TRUE_%d)" % counter
    end_label = "(EQ_END_%d)" % counter

    return [
        d_equals_a_minus_d(),   # D=A-D
        d_jeq(true_label),      # @true_label -> D;JEQ
        set_d(FALSE),           # D=FALSE
        jump(end_label),        # JMP end_label
        true_label,
        set_d(TRUE),            # D=TRUE
        end_label,
    ]


def push(segment, index):
    """Assembly for push commands."""
    if segment == "constant":
        return [
            set_d(index),   # D=index
            sp_equals_d(),  # *SP=D
            inc_sp(),       # SP++
        ]

    print "Push: Unhandled segment '%s'" % segment


def pop(segment, index):
    """Assembly for pop commands."""
    pass
