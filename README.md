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

<Real Task-2>
#From the fastbot robot

1. Clone the fastbot_bringup repo:
cd ~/ros2_ws/src
git clone https://github.com/Andreas-Ioannou/fastbot_cp20.git

2. Clone the Checkpoint-22 repo:
git clone https://github.com/Andreas-Ioannou/fastbot_ros2_docker.git

3. Clone the fastbot_slam repo:
git clone https://github.com/Andreas-Ioannou/fastbot_slam.git

4. Navigate into the fastbot_ros2_docker folder and build images locally:
cd ~/ros2_ws/src/fastbot_ros2_docker
docker-compose build

5. Start containers
docker-compose up -d

# Check:
docker ps
ros2 topic list

# To start the docker containers automatically when the robot is powered on
cd ~/ros2_ws/src/fastbot_ros2_docker/autostart
sudo ./install.sh <robot-username>