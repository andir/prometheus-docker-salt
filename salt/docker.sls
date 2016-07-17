docker-repo:
  pkgrepo.managed:
    - humanname: docker.io repo
    - name: deb https://apt.dockerproject.org/repo debian-jessie main
    - dist: debian-jessie
    - file: /etc/apt/sources.list.d/docker.list
    - keyid: 58118E89F3A912897C070ADBF76221572C52609D
    - keyserver: keyserver.ubuntu.com
    - require:
      - pkg: apt-transport-https

docker:
  pkg.latest:
    - pkgs:
      - docker-engine
    - require:
       - pkgrepo: docker-repo
  service.running:
    - enable: True
    - require:
       - pkg: docker

python-docker-requirement:
  pkg.installed:
    - name: python-pip

python-docker:
  pip.installed:
    - name: docker-py
    - require:
      - pkg: python-docker-requirement
      - pkg: docker
