"""Instructions sets for Hack assembly."""


def instruction(comment):
    """Prepend instruction comment and append a new line."""
    def decorator(function):
        def wrapper(*args, **kwargs):
            return ["\n// %s" % comment] + function(*args, **kwargs)
        return wrapper
    return decorator


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


@instruction("D=-D")
def d_equals_neg_d():
    """Instruction set for D=-D."""
    return ["D=-D"]


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


@instruction("JMP to label_or_address")
def jump(label_or_address):
    """Instruction set for JMP."""
    return generate_jump("0", "JMP", label_or_address)


@instruction("JMP to label_or_address if D == 0")
def d_jeq(label_or_address):
    """Instruction set for D;JEQ."""
    return generate_jump("D", "JEQ", label_or_address)


def generate_jump(condition, jump_type, label_or_address):
    """Generate all types of jump instruction sets."""
    return [
        "@%s" % label_or_address,
        "%s;%s" % condition, jump_type,
    ]
