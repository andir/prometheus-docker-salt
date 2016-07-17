containers:
  freifunk-prometheus:
    image: prom/prometheus:latest
    hostname: ffda-prometheus
    volumes:
      /srv/prometheus: /prometheus
    ports:
     - 9090:9090

  freifunk-grafana:
    hostname: ffda-grafana
    image: grafana/grafana:latest
    volumes:
      /srv/grafana/lib: /var/lib/grafana
      /srv/grafana/log: /var/log/grafana 
      /srv/grafana/etc: /etc/grafana:ro
    environment:
      GF_SECURITY_ADMIN_PASSWORD: foobarbaz123
    ports:
      - 3000:3000
