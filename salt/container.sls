{% for container, config in pillar['containers'].items() %}
{% set environment = config.get('environment', {}) %}
{% set ports = config.get('ports', []) %}
{% set volumes = config.get('volumes', []) %}
container-{{ container }}:
  dockerng.running:
    - name: {{ container }}
    - image: {{ config['image'] }}
    - hostname: {{ config['hostname'] }}
{% if environment %}
    - environment:
{% for key, value in config.get('environment', {}).items() %}
        {{ key }}: "{{ value }}"
{% endfor %}
{% endif %}
{% if ports %}
    - port_bindings:
{% for port in ports %}
      - {{ port }}
{% endfor %}
{% endif %}
{% if volumes %}
    - binds:
{% for volume, local in volumes.items() %}
      - {{ volume }}:{{local}}
{% endfor %}
{% endif %}
{% endfor %}
