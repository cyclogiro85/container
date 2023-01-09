:$PORT
root * /usr/share/caddy
file_server

header {
    X-Robots-Tag none
    X-Content-Type-Options nosniff
    X-Frame-Options DENY
    Referrer-Policy no-referrer-when-downgrade
}

@websocket_xray_vless {
    header Connection *Upgrade*
    header Upgrade    websocket
    path /$UUID
}
reverse_proxy @websocket_xray_vless unix//etc/caddy/vless

@websocket_xray_vmess {
header Connection *Upgrade*
header Upgrade    websocket
path /$UUID
}
reverse_proxy @websocket_xray_vmess unix//etc/caddy/vmess
