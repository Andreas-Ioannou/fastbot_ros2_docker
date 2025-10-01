#!/usr/bin/env bash
set -e

# Always source ROS 2
source /opt/ros/humble/setup.bash || true

# Also source the install if it exists
if [ -f /colcon/install/setup.bash ]; then
  source /colcon/install/setup.bash
fi

# Build if missing or if src is newer (cheap check)
if [ ! -f /colcon/install/setup.bash ] || [ /ws/src -nt /colcon/install ]; then
  echo "[entrypoint] Building /ws/src into /colcon ..."
  mkdir -p /colcon
  cd /ws
  colcon build --symlink-install --merge-install --base-paths /ws/src \
    --cmake-args -DCMAKE_BUILD_TYPE=Release
  source /colcon/install/setup.bash
fi

exec "$@"
