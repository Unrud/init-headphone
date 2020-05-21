DISTCHECK_CONFIGURE_FLAGS = \
  --with-systemdsystemunitdir=$$dc_install_base/$(systemdsystemunitdir)

if HAVE_SYSTEMD
systemdsystemunit_DATA = \
  init-headphone.service
endif

sbin_SCRIPTS = init-headphone

CLEANFILES = init-headphone init-headphone.service

do_substitutions = sed \
	-e 's|\@sbindir\@|$(sbindir)|g' \
	-e 's|\@PACKAGE_VERSION\@|$(PACKAGE_VERSION)|g' \
	-e 's|\@PYTHON\@|$(PYTHON)|g' \
	-e 's|\@MODPROBE\@|$(MODPROBE)|g'

init-headphone: src/init-headphone.in Makefile
	$(do_substitutions) $< > $@
	chmod +x $@

init-headphone.service: init-headphone.service.in Makefile
	$(do_substitutions) $< > $@
