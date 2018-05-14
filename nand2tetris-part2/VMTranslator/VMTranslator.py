"""Tranlsates Jack VM code into Hack Assembly."""

import sys
import itertools
import commands

command_list = {
    # arithmetic
    "add": commands.add,
    "sub": commands.sub,
    "neg": commands.neg,
    "and": commands.bitwise_and,
    "or": commands.bitwise_or,
    "not": commands.bitwise_not,
    "eq": commands.eq,
    "gt": commands.gt,
    "lt": commands.lt,

    # memory access
    "push": commands.push,
    "pop": commands.pop,
}


def translate(line):
    """Translate a line of VM code into Hack assembly."""
    command = line.split()[0]

    if command not in command_list:
        print "Line '%s' contains an invalid command. Bailing out..." % line
        sys.exit()

    return list(itertools.chain(*command_list[command](*(line.split()[1:]))))


if __name__ == "__main__":
    try:
        in_file = sys.argv[1]
    except IndexError:
        print "Usage: %s <input file>" % sys.argv[0]
        sys.exit()

    # Get our input lines; drop all comments and blank lines
    with open(in_file, "r") as f:
        program_lines = [line.strip() for line in f.read().split("\n")
                         if line.strip() != "" and line[:2] != "//"]

    # Generate assembly
    line_count = 0
    with open(in_file.replace(".vm", ".asm"), "w") as f:
        for line in program_lines:
            line_count += 1
            if line_count > 1:
                f.write("\n\n")
            f.write("// VM Code: " + line)
            f.write("\n".join(translate(line)))
