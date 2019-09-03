# GDK 3 (GTK 3)
# https://wiki.archlinux.org/index.php/HiDPI#GDK_3_(GTK_3)
export GDK_SCALE=2

# QT
# https://wiki.archlinux.org/index.php/HiDPI#Qt_5
# https://doc.qt.io/qt-5/highdpi.html
# https://blog.qt.io/blog/2016/01/26/high-dpi-support-in-qt-5-6/
#export QT_SCALE_FACTOR=2  # Causes qutebrowser UI fonts to have large gaps.
export QT_FONT_DPI=192  # Scales qutebrowser UI fonts as expected.
