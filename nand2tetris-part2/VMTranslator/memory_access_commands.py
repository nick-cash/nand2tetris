"""Hack assembly generators for memory map VM code."""
import sys
from decorators import update_sp
from instructions import set_d, dec_sp, d_equals_sp


@update_sp
def push(segment, offset):
    """Assembly for push commands."""
    if segment == "constant":
        return [set_d(offset)]
    elif segment in DIRECT_SEGMENT_MAP:
        return [
            [
                "\n@%s" % DIRECT_SEGMENT_MAP[segment](offset),
                "D=M",
            ]
        ]
    else:
        ptr, offset = PTR_SEGMENT_MAP[segment](offset)
        return [
            set_d(offset),
            [
                "@%s" % ptr,
                "A=D+M",
                "D=M",
            ]
        ]


def pop(segment, offset):
    """Assembly for pop commands."""
    if segment in DIRECT_SEGMENT_MAP:
        return [
            dec_sp(),
            d_equals_sp(),
            [
                "@%s" % DIRECT_SEGMENT_MAP[segment](offset),
                "M=D",
            ],
        ]
    else:
        ptr, offset = PTR_SEGMENT_MAP[segment](offset)
        return [
            # Compute the final destination
            set_d(offset),
            [
                "@%s" % ptr,
                "D=D+M",
                "@R15",
                "M=D"
            ],

            dec_sp(),
            d_equals_sp(),

            # Finally, save the data
            [
                "@R15",
                "A=M",
                "M=D",
            ],
        ]


def args_local(offset):
    """Argument tuple for push and pop for local commands."""
    return ("LCL", offset,)


def args_argument(offset):
    """Argument tuple for push and pop for argument commands."""
    return ("ARG", offset,)


def args_this(offset):
    """Argument tuple for push and pop for this commands."""
    return ("THIS", offset,)


def args_that(offset):
    """Argument tuple for push and pop for that commands."""
    return ("THAT", offset,)


def args_static(offset):
    """Argument tuple for push and pop for static commands."""
    file_name = sys.argv[1].split("/")[-1].replace(".vm", "")
    return "%s.%d" % (file_name, int(offset))


def args_temp(offset):
    """Argument tuple for push and pop for temp commands."""
    return str(5 + int(offset))


def args_pointer(offset):
    """Argument tuple for push and pop for pointer commands."""
    return str(3 + int(offset))


PTR_SEGMENT_MAP = {
    "local": args_local,
    "argument": args_argument,
    "this": args_this,
    "that": args_that,
}

DIRECT_SEGMENT_MAP = {
    "temp": args_temp,
    "static": args_static,
    "pointer": args_pointer,
}
