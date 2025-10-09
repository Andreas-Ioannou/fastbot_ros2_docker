<Simulation Task-1>
#From the checkpoint-22 enviroment

1. Navigate to the simulation folder:
cd ~/ros2_ws/src/fastbot_ros2_docker/simulation

2. Pull the Docker images and start the required containers with the following command:
docker-compose up

#The Gazebo simulator and RVIZ2 should pop up

3. To find the webpage's address type in terminal:
 webpage_address

 #Access the given url and enter the rosbridge address (type: rosbridge_address in terminal)

 #To connect to the robot press the connect button

# Real Task-2
## From the fastbot robot

1. If ros2 fastbot packages are not installed, clone the fastbot_bringup repo:
cd ~/ros2_ws/src
git clone https://github.com/Andreas-Ioannou/fastbot_cp20.git

2. Clone the Checkpoint-22 repo:
git clone https://github.com/Andreas-Ioannou/fastbot_ros2_docker.git

3. Pull the pre-built docker images:
docker pull andreasros/fastbot-ros2-real:real
docker pull andreasros/fastbot-ros2-slam-real:real

4. Bringup
docker compose up

## From another terminal (fastbot)

5. Echo the scan, camera topic: 
docker compose exec fastbot bash -lc '
  source /opt/ros/humble/setup.bash && source /ros2_ws/install/setup.bash
  ros2 topic echo /fastbot/scan
'

docker compose exec fastbot bash -lc '
  source /opt/ros/humble/setup.bash && source /ros2_ws/install/setup.bash
  ros2 topic echo /fastbot_camera/camera/image_raw
'

6. Send velocity commands to the robot:

docker compose exec fastbot bash -lc '
  source /opt/ros/humble/setup.bash && source /ros2_ws/install/setup.bash &&
  ros2 topic pub -r 10 /fastbot/cmd_vel geometry_msgs/Twist "linear:
  x: 0.05
  y: 0.0
  z: 0.0
angular:
  x: 0.0
  y: 0.0
  z: 0.0"
'

Comment: Adjust topic names to your configuration 

7. List all robot topics from an external computer:

Option A (native ROS 2 Humble installed):

source /opt/ros/humble/setup.bash
export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
export ROS_DOMAIN_ID=0
unset ROS_LOCALHOST_ONLY
ros2 daemon stop; sleep 1; ros2 daemon start; sleep 1
ros2 topic list          # should show /fastbot/scan, /map, /tf, ...
rviz2                    # Fixed Frame: map; add Map(/map), LaserScan(/fastbot/scan), TF

