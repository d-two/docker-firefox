ARG BASE_IMAGE_PREFIX

FROM multiarch/qemu-user-static as qemu

FROM ${BASE_IMAGE_PREFIX}alpine:latest

COPY --from=qemu /usr/bin/qemu-*-static /usr/bin/

RUN apk add --no-cache \
	alsa-lib \
	ca-certificates \
	firefox-esr \
	hicolor-icon-theme \
	mesa-dri-intel \
	mesa-gl \
	ttf-dejavu

RUN rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/* /usr/bin/qemu-*-static

ENTRYPOINT ["/usr/bin/firefox"]
