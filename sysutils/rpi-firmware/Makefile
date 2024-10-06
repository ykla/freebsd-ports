PORTNAME=	rpi-firmware
PORTVERSION=	1.20241001.g20241001
CATEGORIES=	sysutils

MAINTAINER=	uboot@FreeBSD.org
COMMENT=	Firmware for RaspberryPi Single Board Computer
WWW=		https://github.com/raspberrypi/firmware

LICENSE=	BROADCOM
LICENSE_NAME=	Broadcom Corporation
LICENSE_FILE=	${WRKSRC}/boot/LICENCE.broadcom
LICENSE_PERMS=	dist-mirror no-dist-sell pkg-mirror no-pkg-sell auto-accept

BUILD_DEPENDS=	aarch64-none-elf-gcc:devel/aarch64-none-elf-gcc

USE_GITHUB=	yes

GH_ACCOUNT=	raspberrypi freebsd:pscimon
GH_PROJECT=	firmware rpi3-psci-monitor:pscimon
FW_TAG=		287e6a6
PSCI_TAG=	558620c
GH_TAGNAME=	${FW_TAG} ${PSCI_TAG}:pscimon

BUILD_WRKSRC=	${WRKSRC_pscimon}
INSTALL_DIR=	${PREFIX}/share/${PORTNAME}

CONFIG_TXT_FILES=	config.txt \
			config_rpi_0_w.txt \
			config_rpi3.txt \
			config_rpi3_edk2.txt \
			config_rpi4.txt \
			config_arm64.txt

do-patch:
.for i in ${CONFIG_TXT_FILES}
	${CP} ${FILESDIR}/${i} ${WRKSRC}/boot/
.endfor

post-patch:
	${RM} ${WRKSRC}/boot/kernel.img
	${RM} ${WRKSRC}/boot/kernel7.img
	${RM} ${WRKSRC}/boot/kernel7l.img
	${RM} ${WRKSRC}/boot/kernel8.img
	${RM} ${WRKSRC}/boot/kernel_2712.img
	${RM} ${WRKSRC}/boot/bcm2712-rpi-5-b.dtb
	${RM} ${WRKSRC}/boot/bcm2712-rpi-cm5-cm4io.dtb
	${RM} ${WRKSRC}/boot/bcm2712-rpi-cm5-cm5io.dtb
	${RM} ${WRKSRC}/boot/bcm2712-rpi-cm5l-cm4io.dtb
	${RM} ${WRKSRC}/boot/bcm2712-rpi-cm5l-cm5io.dtb
	${RM} ${WRKSRC}/boot/bcm2712d0-rpi-5-b.dtb
	${RM} ${WRKSRC}/overlays/bcm2712d0.dtbo
	${RM} ${WRKSRC}/overlays/disable-bt-pi5.dtbo
	${RM} ${WRKSRC}/overlays/disable-wifi-pi5.dtbo
	${RM} ${WRKSRC}/overlays/i2c0-pi5.dtbo
	${RM} ${WRKSRC}/overlays/i2c1-pi5.dtbo
	${RM} ${WRKSRC}/overlays/i2c2-pi5.dtbo
	${RM} ${WRKSRC}/overlays/i2c3-pi5.dtbo
	${RM} ${WRKSRC}/overlays/imx500-pi5.dtbo
	${RM} ${WRKSRC}/overlays/midi-uart0-pi5.dtbo
	${RM} ${WRKSRC}/overlays/midi-uart1-pi5.dtbo
	${RM} ${WRKSRC}/overlays/midi-uart2-pi5.dtbo
	${RM} ${WRKSRC}/overlays/midi-uart3-pi5.dtbo
	${RM} ${WRKSRC}/overlays/midi-uart4-pi5.dtbo
	${RM} ${WRKSRC}/overlays/pcie-32bit-dma-pi5.dtbo
	${RM} ${WRKSRC}/overlays/pciex1-compat-pi5.dtbo
	${RM} ${WRKSRC}/overlays/pisound-pi5.dtbo
	${RM} ${WRKSRC}/overlays/sdio-pi5.dtbo
	${RM} ${WRKSRC}/overlays/spi2-1cs-pi5.dtbo
	${RM} ${WRKSRC}/overlays/spi2-2cs-pi5.dtbo
	${RM} ${WRKSRC}/overlays/spi3-1cs-pi5.dtbo
	${RM} ${WRKSRC}/overlays/spi3-2cs-pi5.dtbo
	${RM} ${WRKSRC}/overlays/spi5-1cs-pi5.dtbo
	${RM} ${WRKSRC}/overlays/spi5-2cs-pi5.dtbo
	${RM} ${WRKSRC}/overlays/uart0-pi5.dtbo
	${RM} ${WRKSRC}/overlays/uart1-pi5.dtbo
	${RM} ${WRKSRC}/overlays/uart2-pi5.dtbo
	${RM} ${WRKSRC}/overlays/uart3-pi5.dtbo
	${RM} ${WRKSRC}/overlays/uart4-pi5.dtbo
	${RM} ${WRKSRC}/overlays/vc4-kms-v3d-pi5.dtbo
	${RM} ${WRKSRC}/overlays/w1-gpio-pi5.dtbo
	${RM} ${WRKSRC}/overlays/w1-gpio-pullup-pi5.dtbo
	${RM} ${WRKSRC}/overlays/w1-gpio-pi5.dtbo

do-install:
	${MKDIR} ${STAGEDIR}/${INSTALL_DIR}
	cd ${WRKSRC}/boot && ${COPYTREE_SHARE} . ${STAGEDIR}/${INSTALL_DIR}/
	${INSTALL_DATA} ${WRKSRC_pscimon}/armstub8.bin \
	    ${WRKSRC_pscimon}/armstub8-gic.bin ${STAGEDIR}/${INSTALL_DIR}/

.include <bsd.port.mk>
