DISTCHECK_CONFIGURE_FLAGS = \
  --with-systemdsystemunitdir=$$dc_install_base/$(systemdsystemunitdir)

if HAVE_SYSTEMD
systemdsystemunit_DATA = \
  init-headphone.service
endif

sbin_SCRIPTS = src/init-headphone

CLEANFILES = init-headphone.service

init-headphone.service: init-headphone.service.in Makefile
	sed -e 's,$${sbindir},${sbindir},g' init-headphone.service.in > init-headphone.service
