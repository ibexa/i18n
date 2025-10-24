import re
import sys
from pathlib import Path

def fix_indentation(input_path):
    with open(input_path, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    output_lines = []
    in_trans_unit = False
    src_indent = None
    for line in lines:
        if '<trans-unit' in line:
            in_trans_unit = True
            src_indent = None
        if '</trans-unit>' in line:
            in_trans_unit = False
            src_indent = None
        if in_trans_unit and '<source>' in line:
            src_indent = re.match(r'^(\s*)<source>', line)
            output_lines.append(line)
            continue
        if in_trans_unit and '<target' in line and src_indent:
            tgt_indent = re.match(r'^(\s*)<target', line)
            if tgt_indent and tgt_indent.group(1) != src_indent.group(1):
                line = re.sub(r'^(\s*)<target', src_indent.group(1) + '<target', line)
            output_lines.append(line)
            continue
        output_lines.append(line)

    with open(input_path, 'w', encoding='utf-8') as f:
        f.writelines(output_lines)

if __name__ == "__main__":
    # Fix all .xlf files recursively from current directory
    for xlf_file in Path('.').rglob('*.xlf'):
        print(f"Fixing indentation in {xlf_file}")
        fix_indentation(str(xlf_file))
