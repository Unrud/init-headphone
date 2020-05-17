DISTCHECK_CONFIGURE_FLAGS = \
  --with-systemdsystemunitdir=$$dc_install_base/$(systemdsystemunitdir)

if HAVE_SYSTEMD
systemdsystemunit_DATA = \
  init-headphone.service
endif

sbin_SCRIPTS = init-headphone

CLEANFILES = init-headphone init-headphone.service

init-headphone: src/init-headphone.in Makefile
	sed -e 's|@PYTHON[@]|$(PYTHON)|g' -e 's|@MODPROBE[@]|$(MODPROBE)|g' $< > $@
	chmod +x $@

init-headphone.service: init-headphone.service.in Makefile
	sed -e 's|@sbindir[@]|$(sbindir)|g' $< > $@
