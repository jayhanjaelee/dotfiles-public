#!/bin/bash

# ~/.config 의 ghostty, herdr 설정을 레포의 .config/ 로 복사한다.

set -euo pipefail

script_dir="$(cd "$(dirname "$0")" && pwd)"
dest_root="$script_dir/.config"

# 복사할 파일 (~/.config 기준 상대 경로)
# herdr 은 로그/소켓/세션 파일이 섞여 있어서 설정 파일만 복사한다.
files=(
    ghostty/config
    herdr/config.toml
)

for rel in "${files[@]}"; do
    src="$HOME/.config/$rel"
    dest="$dest_root/$rel"

    if [[ ! -f "$src" ]]; then
        echo "Skip: $src not found."
        continue
    fi

    # 심볼릭 링크로 레포를 가리키고 있으면 같은 파일이므로 복사할 필요 없음
    if [[ -e "$dest" && "$src" -ef "$dest" ]]; then
        echo "Skip: $src is already linked to $dest"
        continue
    fi

    mkdir -p "$(dirname "$dest")"
    cp -L "$src" "$dest"
    echo "Copied $src to $dest"
done
