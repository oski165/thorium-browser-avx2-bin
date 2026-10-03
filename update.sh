#!/bin/bash
set -euo pipefail

REPO="gz83/thorium"

latest_version="$(
    curl -fsSL "https://api.github.com/repos/${REPO}/releases?per_page=100" |
        jq -r '
            .[]
            | .assets[]
            | select(.name | endswith("_AVX2.deb"))
            | .name
        ' |
        sed -E 's/^thorium-browser_([0-9.]+)_AVX2\.deb$/\1/' |
        sort -V |
        tail -1
)"

current_version="$(
    sed -n 's/^pkgver=\(.*\)$/\1/p' PKGBUILD
)"

if [[ -z "$latest_version" ]]; then
    echo "Nie udało się znaleźć najnowszej wersji AVX2."
    exit 1
fi

echo "Aktualna wersja: $current_version"
echo "Najnowsza wersja: $latest_version"

if [[ "$latest_version" == "$current_version" ]]; then
    echo "Pakiet jest już aktualny."
    exit 0
fi

echo "Aktualizuję PKGBUILD: $current_version -> $latest_version"

sed -i "s/^pkgver=.*/pkgver=${latest_version}/" PKGBUILD

echo "Pobieranie nowego źródła i aktualizacja checksum..."

updpkgsums

echo "Regenerowanie .SRCINFO..."

makepkg --printsrcinfo > .SRCINFO

echo
echo "Gotowe."
echo "Nowa wersja: $latest_version"
