#!/usr/bin/env bash
set -euo pipefail
project_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
sudo apt-get update
sudo apt-get install -y \
  python3.12-venv python3-pip python3-numpy python3-opencv \
  python3-colcon-common-extensions \
  ros-jazzy-rclpy ros-jazzy-cv-bridge ros-jazzy-image-geometry \
  ros-jazzy-tf2-ros ros-jazzy-tf2-geometry-msgs ros-jazzy-message-filters \
  ros-jazzy-sensor-msgs ros-jazzy-geometry-msgs ros-jazzy-visualization-msgs \
  ros-jazzy-realsense2-camera ros-jazzy-realsense2-description \
  ros-jazzy-rviz2 ros-jazzy-robot-state-publisher \
  ros-jazzy-ros-gz-sim ros-jazzy-turtlebot3-gazebo
/usr/bin/python3 -m venv --system-site-packages "$project_dir/.venv"
"$project_dir/.venv/bin/python" -m pip install -r "$project_dir/requirements.txt"
