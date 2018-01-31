PREFIX=/usr/local
bindir=$(PREFIX)/bin
unitdir=/etc/systemd/system

all:

install: install-scripts install-units

install-scripts:
	install -m 755 restic-backup $(bindir)
	install -m 755 restic-clean $(bindir)

install-units:
	install restic-backup@.service $(unitdir)
	install restic-clean@.service $(unitdir)
