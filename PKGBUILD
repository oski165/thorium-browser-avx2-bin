pkgname=thorium-browser-avx2-bin
pkgver=154.0.8037.45
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

sha256sums=('23a2d6ddffbd76ed95ed80ed24a1338084180b7d36d11eac92144c7519a3f08b')

package() {
    bsdtar -xf "$srcdir/thorium-browser_${pkgver}_AVX2.deb" \
        -O data.tar.xz |
        bsdtar -xJf - -C "$pkgdir"
}
