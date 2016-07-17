

openssh-server:
  pkg.installed:
    - pkgs:
      - openssh-server
ssh:
  service.running:
    - enable: True
    - require:
      - pkg: openssh-server

/etc/root/.ssh/authorized_keys:
  file.managed:
    - makedirs: True
    - user: root
    - group: root
    - mode: 600
    - contents: |
        ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAgEAs8mIYfT2H8ZdbUJ92SUSMpjbI0Iew/CIiu+NSQ0oG1msmet6fB9xC3sxHt4FdVRmixNM7cvJ8+QipJjnP+Ek0E8AdY08gi6MkchSQFg5bw8IHx4hnM2CH2IK/XJQER4QMlyZKf5K0xhlG1juUFVHBw5apxGowGT4jxrfzACgGpWQ/b42TwquQuuHg/rvglW5Xmy2RCG958ph7tG0Vq1rm4DYW9fhsz14apHF5uDM+aipFjCIXatM1M0X4F3ns9sl0zy2Zy6RDbY9hr/3hSQYpavgyDAxnY5mAOygFs0SsPMxt1z+Fal6yZOEy7RUPeLlkeGs5rLNnxi2BTbunDzMJ5Tp9gxY7GS3KULl+IF8QcxJKwknIhv+5ifYCihhIw7wP7N/3z6eBvVBZZMfeqYHE3jbSZWyYB5y67cGkepqtSyPxldPBtDwutI59NAST03W2knWWyoBGi1yBqoBlICS5bKbA7srlOiq1Qn3b+zGd7nwMoybK5zJX5FNejKMul7mshLd4m71JL8PDGv+HE6tyCsE2YLbvbTUERr0bVe+CpU/CVG8aQi74CY/oZ0Y9OFpo5KApA/FYyAwqk3chAq75mzR7sJtxRHa7JMoHY7S5ESbi+AB4aOh6BcQxdmVYmDhQ3JJzUg0EZ3ytkbEJ82ezjDqeXX93vkji0wHTK5h84s= rammhold.de
    - require:
       - pkg: openssh-server


