PREFIX=/usr/local
bindir=$(PREFIX)/bin
unitdir=/etc/systemd/system

all:

install: install-scripts install-units

install-scripts:
	install -m 755 restic-backup $(bindir)
	install -m 755 restic-clean $(bindir)
	install -m 755 restic-helper $(bindir)

install-units:
	install -m 644 restic-backup@.service $(unitdir)
	install -m 644 restic-clean@.service $(unitdir)
