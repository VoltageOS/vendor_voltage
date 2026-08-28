#!/usr/bin/env python3
import os

script_dir = os.path.dirname(os.path.abspath(__file__))

with open(f"{script_dir}/../vars/aosp_target_release") as f:
    for line in f.readlines():
        line = line.strip()

        if line.startswith("aosp_target_release="):
            _, aosp_target_release = line.split("=", 1)
            break

for path in [
    f"{script_dir}/../release/flag_values/{aosp_target_release}/RELEASE_BUILD_CLANG_VERSION.textproto",
    f"build/release/flag_values/{aosp_target_release}/RELEASE_BUILD_CLANG_VERSION.textproto",
]:
    if not os.path.exists(path):
        continue

    with open(path) as f:
        for line in f.readlines():
            line = line.strip()

            if line.startswith("string_value:"):
                _, clang_version = line.split(":", 1)
                print(clang_version.strip()[1:-1])
                exit()
