pkgname=dwm
pkgver=20150529
pkgrel=1
pkgdesc='A dynamic window manager for X'

arch=('i686' 'x86_64')
license=('MIT')
depends=('libx11' 'libxinerama')
source=(git://github.com/enten/$pkgname)
sha256sums=('SKIP')

build() {
	cd $srcdir/$pkgname
	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
	cd $srcdir/$pkgname
	make PREFIX=/usr DESTDIR=$pkgdir install
	#install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
	#install -Dm644 README $pkgdir/usr/share/doc/$pkgname/README
	#install -Dm644 dwm.desktop $pkgdir/usr/share/xsessions/dwm.desktop
}

