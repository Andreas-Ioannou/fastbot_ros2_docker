#!/usr/bin/env bash
set -e

# Source ROS 2 Humble
source /opt/ros/humble/setup.bash || true

# Fresh container-local build dirs
rm -rf /colcon/build /colcon/install /colcon/log || true
mkdir -p /colcon

if [ -d /ws/src ]; then
  echo "[entrypoint] Building /ws/src into /colcon ..."
  colcon build \
    --base-paths /ws/src \
    --build-base /colcon/build \
    --install-base /colcon/install \
    --symlink-install
  source /colcon/install/setup.bash || true
else
  echo "[entrypoint] /ws/src not found; skipping build."
fi

exec "$@"
