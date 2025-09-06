#!/bin/bash

talosctl apply-config --insecure --nodes $WORKER_IP --file talos/worker.yaml