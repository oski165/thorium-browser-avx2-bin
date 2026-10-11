pkgname=thorium-browser-avx2-bin
pkgver=156.0.8078.28
pkgrel=1
pkgdesc='Thorium Browser optimized for AVX2'
arch=('x86_64')
url='https://thorium.rocks/'
license=('BSD-3-Clause')

depends=(
    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'ca-certificates'
    'cups'
    'dbus'
    'expat'
    'fontconfig'
    'freetype2'
    'glib2'
    'gtk3'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxrandr'
    'nspr'
    'nss'
    'pango'
    'systemd-libs'
    'vulkan-icd-loader'
    'wget'
    'xdg-utils'
)

provides=('thorium-browser')
conflicts=('thorium-browser')

source=(
    "https://github.com/gz83/thorium/releases/download/M${pkgver}/thorium-browser_${pkgver}_AVX2.deb"
)

sha256sums=('15496ebae54d15a946e1cad9ecc174f50008cc355e35be58ff339ec23bf00846')

package() {
    bsdtar -xf "$srcdir/thorium-browser_${pkgver}_AVX2.deb" \
        -O data.tar.xz |
        bsdtar -xJf - -C "$pkgdir"
}
