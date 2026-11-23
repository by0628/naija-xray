FROM ghcr.io/xtls/xray-core:latest AS xrayimg
FROM alpine:3.20
COPY --from=xrayimg /usr/local/bin/xray /usr/local/bin/xray
COPY --from=xrayimg /usr/local/share/xray/ /usr/local/share/xray/
COPY --chmod=755 entrypoint.sh /entrypoint.sh
COPY config.json.template /config.json.template
ENTRYPOINT ["/entrypoint.sh"]
