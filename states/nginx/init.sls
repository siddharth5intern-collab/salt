nginx:
  pkg.installed:
    - name: nginx

  service.running:
    - name: nginx
    - enable: True
    - reload: True

/etc/nginx/sites-available/bookstore:
  file.managed:
    - source: salt://nginx/bookstore.jinja
    - template: jinja
    - context:
        backend_servers: {{ salt['mine.get']('api*', 'network.ip_addrs') }}
        frontend_server: {{ pillar['nginx']['frontend_server'] }}
        server_name: {{ pillar['nginx']['server_name'] }}
    - require:
      - pkg: nginx


/etc/nginx/sites-enabled/bookstore:
  file.symlink:
    - target: /etc/nginx/sites-available/bookstore
    - require:
      - file: /etc/nginx/sites-available/bookstore
