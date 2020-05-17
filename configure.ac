AC_INIT([init-headphone], [0.12])

AM_PATH_PYTHON([3.3],, [AM_PATH_PYTHON([2.7],,
    [AC_MSG_ERROR([python >= 3.3 or python >= 2.7 not found])])])
AC_PATH_PROG([MODPROBE], [modprobe])
AS_IF([test "x$MODPROBE" = "x"], [AC_MSG_ERROR([modprobe not found])])

PKG_PROG_PKG_CONFIG
AC_ARG_WITH([systemdsystemunitdir],
    [AS_HELP_STRING([--with-systemdsystemunitdir=DIR], [Directory for systemd service files])],,
    [with_systemdsystemunitdir=auto])
AS_IF([test "x$with_systemdsystemunitdir" = "xyes" -o "x$with_systemdsystemunitdir" = "xauto"], [
    def_systemdsystemunitdir=$($PKG_CONFIG --variable=systemdsystemunitdir systemd)
    AS_IF([test "x$def_systemdsystemunitdir" = "x"], [
            AS_IF([test "x$with_systemdsystemunitdir" = "xyes"],
                [AC_MSG_ERROR([systemd support requested but pkg-config unable to query systemd package])])
            with_systemdsystemunitdir=no],
        [with_systemdsystemunitdir="$def_systemdsystemunitdir"])])
AS_IF([test "x$with_systemdsystemunitdir" != "xno"],
    [AC_SUBST([systemdsystemunitdir], [$with_systemdsystemunitdir])])
AM_CONDITIONAL([HAVE_SYSTEMD], [test "x$with_systemdsystemunitdir" != "xno"])

AM_INIT_AUTOMAKE([foreign])

AC_CONFIG_FILES([Makefile])

AC_OUTPUT
