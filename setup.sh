#!/bin/bash

# Create project directory structure
mkdir -p fedora-workstation-playbook/{roles,vars,tasks}

# Create main.yml
cat <<EOL > fedora-workstation-playbook/main.yml
---
- name: Fedora 41+ Workstation Setup
  hosts: localhost
  become: true
  roles:
    - development
    - desktop
    - security
    - utilities
EOL

# Create initial files for roles
for role in development desktop security utilities; do
  mkdir -p fedora-workstation-playbook/roles/$role/tasks
  echo "---" > fedora-workstation-playbook/roles/$role/tasks/main.yml
done

# Create vars directory and file
echo "---" > fedora-workstation-playbook/vars/main.yml

echo "Project structure created successfully."
