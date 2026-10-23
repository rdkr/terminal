#!/usr/bin/env sh
set -eu

cd "$(dirname "$0")/.."
tool="${CONTAINER_TOOL:-podman}"

for image in fedora:latest debian:stable ubuntu:latest rockylinux:9; do
  echo "=== $image"
  "$tool" build -f test/Containerfile --build-arg BASE="$image" -t "terminal-test:$(echo "$image" | tr ':/' '--')" .
done
