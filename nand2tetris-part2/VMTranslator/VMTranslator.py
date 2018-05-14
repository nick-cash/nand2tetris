"""Tranlsates Jack VM code into Hack Assembly."""

import sys
import itertools
import generators

commands = {
    # arithmetic
    "add": generators.add,
    "sub": generators.sub,
    "neg": None,
    "eq": None,
    "gt": None,
    "lt": None,
    "and": None,
    "or": None,
    "not": None,

    # memory access
    "push": generators.push,
    "pop": generators.pop,
}


def translate(line):
    """Translate a line of VM code into Hack assembly."""
    command = line.split()[0]

    if command not in commands:
        print "Line '%s' contains an invalid command. Bailing out..." % line
        sys.exit()

    print list(itertools.chain(*commands[command](*(line.split()[1:]))))

    return list(itertools.chain(*commands[command](*(line.split()[1:]))))


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

    print program_lines

    # Generate assembly
    with open(in_file.replace(".vm", ".asm"), "w") as f:
        for line in program_lines:
                if line != program_lines[0]:
                    f.write("\n\n")
                f.write("// VM Code: " + line)
                f.write("\n".join(translate(line)))
