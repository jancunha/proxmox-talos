#!/bin/bash

talosctl apply-config --insecure --nodes $CONTROL_PLANE_IP --file talos/controlplane.yaml