"""Methods that generate Hack assembly from provided VM code."""


def instruction(comment):
    """Prepend instruction comment and append a new line."""
    def decorator(function):
        def wrapper(*args, **kwargs):
            return ["\n// %s" % comment] + function(*args, **kwargs)
        return wrapper
    return decorator


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


# Commands
@binary
def add():
    """Assembly for add commands."""
    return [d_equals_d_plus_a()]    # D=D+A


@binary
def sub():
    """Assembly for sub commands."""
    return [d_equals_a_minus_d()]   # D=A-D


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


# Instructions
@instruction("SP++")
def inc_sp():
    """Instruction set for SP++."""
    return [
        "@SP",
        "M=M+1",
    ]


@instruction("SP--")
def dec_sp():
    """Instruction set for SP--."""
    return [
        "@SP",
        "M=M-1",
    ]


@instruction("D=integer")
def set_d(integer):
    """Instruction set for D=integer."""
    return [
        "@%d" % int(integer),
        "D=A",
    ]


@instruction("D=*SP")
def d_equals_sp():
    """Instruction set for D=*SP."""
    return [
        "@SP",
        "A=M",
        "D=M",
    ]


@instruction("D=D+A")
def d_equals_d_plus_a():
    """Instruction set for D=D+A."""
    return ["D=D+A"]


@instruction("D=A-D")
def d_equals_a_minus_d():
    """Instruction set for D=A-D."""
    return ["D=A-D"]


@instruction("A=*SP")
def a_equals_sp():
    """Instruction set for A=*SP."""
    return [
        "@SP",
        "A=M",
        "A=M",
    ]


@instruction("*SP=D")
def sp_equals_d():
    """Instruction set for *SP=D."""
    return [
        "@SP",
        "A=M",
        "M=D",
    ]