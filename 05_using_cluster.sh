#!/bin/bash
set -e

export TALOSCONFIG="talos/talosconfig"
talosctl config endpoint $CONTROL_PLANE_IP
talosctl config node $CONTROL_PLANE_IP

## Bootstrap Etcd
talosctl bootstrap

## Adjust kubeconfig
talosctl kubeconfig ~/.kube/config