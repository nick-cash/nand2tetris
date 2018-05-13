import sys

symbols = {
    "SP": 0,
    "LCL": 1,
    "ARG": 2,
    "THIS": 3,
    "THAT": 4,
    "R0": 0,
    "R1": 1,
    "R2": 2,
    "R3": 3,
    "R4": 4,
    "R5": 5,
    "R6": 6,
    "R7": 7,
    "R8": 8,
    "R9": 9,
    "R10": 10,
    "R11": 11,
    "R12": 12,
    "R13": 13,
    "R14": 14,
    "R15": 15,
    "SCREEN": 16384,
    "KBD": 24576,
}

compute_map = {
    "0": "0101010",
    "1": "0111111",
    "-1": "0111010",
    "D": "0001100",
    "A": "0110000",
    "M": "1110000",
    "!D": "0001101",
    "!A": "0110001",
    "!M": "1110001",
    "-D": "0001111",
    "-A": "0110011",
    "-M": "1110011",
    "D+1": "0011111",
    "A+1": "0110111",
    "M+1": "1110111",
    "D-1": "0001110",
    "A-1": "0110010",
    "M-1": "1110010",
    "D+A": "0000010",
    "D+M": "1000010",
    "D-A": "0010011",
    "D-M": "1010011",
    "A-D": "0000111",
    "M-D": "1000111",
    "D&A": "0000000",
    "D&M": "1000000",
    "D|A": "0010101",
    "D|M": "1010101",
}

dest_map = {
    "null": "000",
    "M": "001",
    "D": "010",
    "MD": "011",
    "A": "100",
    "AM": "101",
    "AD": "110",
    "AMD": "111",
}

jump_map = {
    "null": "000",
    "JGT": "001",
    "JEQ": "010",
    "JGE": "011",
    "JLT": "100",
    "JNE": "101",
    "JLE": "110",
    "JMP": "111",
}

next_address = {
    "rom": 0,
    "ram": 16,
}


def fill_symbol_table_with_labels(program_lines):
    for line in program_lines:
        line = line.strip()
        if line[0] == "(" and line[-1] == ")":
            symbol = line[1:-1]
            symbols[symbol] = next_address["rom"]
            continue
        next_address["rom"] += 1


def generate_binary(instruction):
    # A instructions
    if instruction[0] == "@":
        # Handle Constants
        try:
            symbol_or_const = instruction[1:]
            value = int(symbol_or_const)
        # Handle symbols
        except ValueError:
            if symbol_or_const not in symbols:
                symbols[symbol_or_const] = next_address["ram"]
                next_address["ram"] += 1
            value = symbols[symbol_or_const]

        binary = ("0%s" % bin(value)[2:].zfill(15))
    # C instructions
    else:
        parts = instruction.replace("=", " ").replace(";", " ").split()
        comp = parts[0]
        dest = jump = "null"

        if (instruction.find("=") != -1):
            dest = parts[0]
            comp = parts[1]

        if (instruction.find(";") != -1):
            jump = parts[-1]
            comp = parts[-2]

        binary = ("111%7s%3s%3s" % (compute_map[comp], dest_map[dest], jump_map[jump]))

    return binary

if __name__ == "__main__":
    try:
        in_file = sys.argv[1]
    except IndexError:
        print "Usage: %s <input file>" % sys.argv[0]
        sys.exit()

    # Get our input lines; drop all comments and blank lines
    with open(in_file, "r") as f:
        program_lines = [line for line in f.read().split("\n") if line != "" and line[:2] != "//"]

    # Add non-standard symbols to the table
    fill_symbol_table_with_labels(program_lines)

    # Generate binary
    with open(in_file.replace(".asm", ".hack"), "w") as f:
        for line in program_lines:
            if line[0] != "(":
                eol_comment = line.rfind('//')
                if (eol_comment != -1):
                    line = line[:eol_comment]
                f.write(generate_binary(line.strip()) + "\n")
