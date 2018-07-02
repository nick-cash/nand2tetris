"""Hack assembly generators for arithmetic VM code."""
from decorators import binary, unary, conditional
from instructions import d_equals_a_minus_d, d_equals_d_plus_a, d_jeq, d_jgt, \
    d_jlt, d_equals_neg_d, d_equals_not_d, d_equals_d_and_a, d_equals_d_or_a


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
