nginx:
  backend_servers:
    - 192.168.64.30:5000
    - 192.168.64.31:5000
  frontend_server: 192.168.64.32:3000
  server_name: bookstore.local
