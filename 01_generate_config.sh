#!/bin/bash

## No Agent Installation
# talosctl gen config talos-proxmox-cluster https://$CONTROL_PLANE_IP:6443 --output-dir talos

## With Agent Installation
talosctl gen config talos-proxmox-cluster https://$CONTROL_PLANE_IP:6443 --output-dir talos --install-image factory.talos.dev/installer/ce4c980550dd2ab1b17bbf2b08801c7eb59418eafe8f279833297925d67c7515:v1.11.0