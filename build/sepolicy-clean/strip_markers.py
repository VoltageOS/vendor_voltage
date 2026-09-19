#!/usr/bin/env python3
# SPDX-FileCopyrightText: 2026 VoltageOS
# SPDX-License-Identifier: Apache-2.0
import glob
import re
import sys

PATTERNS = (
    re.compile(rb"^;;\*\s*lm.*$"),
    re.compile(rb"^#line\s.*$"),
)


def clean_file(path: str) -> None:
    with open(path, "rb") as f:
        lines = f.readlines()
    kept = [line for line in lines if not any(p.match(line) for p in PATTERNS)]
    if len(kept) != len(lines):
        with open(path, "wb") as f:
            f.writelines(kept)


def main(argv: list[str]) -> None:
    for pattern in argv[1:]:
        for path in glob.glob(pattern):
            clean_file(path)


if __name__ == "__main__":
    main(sys.argv)
