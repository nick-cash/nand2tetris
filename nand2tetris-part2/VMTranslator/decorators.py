"""Decorators used for translating commands into Hack assembly instructions."""
from instructions import dec_sp, inc_sp, d_equals_sp, sp_equals_d, jump, \
    a_equals_sp, d_equals_a_minus_d


if_counter = 0


def update_sp(function):
    """Automate incrementing the stack pointer."""
    def wrapper(*args, **kwargs):
        return function(*args, **kwargs) + [
            sp_equals_d(),          # *SP=D
            inc_sp(),               # SP++
        ]
    return wrapper


def binary(function):
    """Automate stack handling for binary comands. A=X, D=Y."""
    @update_sp
    def wrapper(*args, **kwargs):
        return [
            dec_sp(),               # SP--
            d_equals_sp(),          # D=*SP
            dec_sp(),               # SP--
            a_equals_sp(),          # A=*SP
        ] + function(*args, **kwargs)
    return wrapper


def unary(function):
    """Automate stack handling for unary comands. Y=D."""
    @update_sp
    def wrapper(*args, **kwargs):
        return [
            dec_sp(),               # SP--
            d_equals_sp(),          # D=*SP
        ] + function(*args, **kwargs)
    return wrapper


def conditional(function):
    """Automate label generation and branching."""
    def wrapper(*args, **kwargs):
        global if_counter

        counter = if_counter
        if_counter += 1

        true_label = "IF_TRUE_%d" % counter
        end_label = "IF_END_%d" % counter

        return [
            d_equals_a_minus_d(),   # D=A-D
            function(true_label),   # Some type of jump
            ["D=0"],                # D=FALSE (0, 0x0000)
            jump(end_label),        # JMP end_label
            ["(%s)" % true_label],
            ["D=-1"],               # D=TRUE (-1, 0xFFFF)
            ["(%s)" % end_label],
        ]
    return wrapper
