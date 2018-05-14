"""Hack assembly generators for arithmetic VM code."""

from instructions import dec_sp, inc_sp, d_equals_sp, \
    a_equals_sp, sp_equals_d, d_equals_a_minus_d, d_equals_d_plus_a, \
    d_equals_neg_d, jump, d_jeq, d_jgt, d_jlt, d_equals_not_d, \
    d_equals_d_and_a, d_equals_d_or_a


TRUE = -1   # 0xFFFF
FALSE = 0   # 0x0000

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
            ["D=0"],                # D=FALSE
            jump(end_label),        # JMP end_label
            ["(%s)" % true_label],
            ["D=-1"],               # D=TRUE
            ["(%s)" % end_label],
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


@unary
def bitwise_not():
    """Assembly for not commands."""
    return [d_equals_not_d()]     # D=!D


@binary
def bitwise_and():
    """Assembly for and commands."""
    return [d_equals_d_and_a()]     # D=D&A


@binary
def bitwise_or():
    """Assembly for or commands."""
    return [d_equals_d_or_a()]     # D=D|A


@binary
@conditional
def eq(true_label):
    """Assembly for eq commands."""
    return d_jeq(true_label)    # @true_label -> D;JEQ


@binary
@conditional
def gt(true_label):
    """Assembly for gt commands."""
    return d_jgt(true_label)    # @true_label -> D;JGT


@binary
@conditional
def lt(true_label):
    """Assembly for lt commands."""
    return d_jlt(true_label)    # @true_label -> D;JLT
