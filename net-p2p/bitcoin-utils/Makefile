MASTERDIR=	${.CURDIR}/../bitcoin
PORTREVISION=	1
PKGNAMESUFFIX=	-utils

COMMENT=	Virtual Peer-to-Peer Currency (CLI and Utilities)
SLAVE_PORT=	yes

OPTIONS_DEFINE=		DEBUG HARDENING TESTS
OPTIONS_DEFAULT=	HARDENING TESTS

CONFIGURE_ARGS=	--without-daemon \
		--without-gui \
		--without-libs \
		--without-qrencode \
		--without-miniupnpc \
		--with-utils \
		--disable-wallet

PLIST_FILES=	bin/bitcoin-cli bin/bitcoin-tx bin/bitcoin-util \
		share/man/man1/bitcoin-cli.1.gz share/man/man1/bitcoin-tx.1.gz \
		share/man/man1/bitcoin-util.1.gz

.include "${MASTERDIR}/Makefile"
