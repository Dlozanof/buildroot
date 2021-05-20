#!/bin/sh

# Store current directory
BOARD_DIR="$(dirname $0)"

# Generate the boot script boot.scr.img
${HOST_DIR}/bin/mkimage -T script -C none -n 'BootLinux' -d ${BOARD_DIR}/boot.scr ${BINARIES_DIR}/boot.scr.uimg

# Generate the SD Card image
GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"

rm -rf "${GENIMAGE_TMP}"

${HOST_DIR}/bin/genimage		\
	--config "${GENIMAGE_CFG}"	\
	--rootpath "${TARGET_DIR}"	\
	--inputpath "${BINARIES_DIR}"	\
        --outputpath "${BINARIES_DIR}"	\
	--tmppath "${GENIMAGE_TMP}"
