#!/usr/bin/env python3
import rclpy
from rclpy.node import Node
from rclpy.qos import QoSProfile, ReliabilityPolicy
from sensor_msgs.msg import LaserScan

class Restamp(Node):
    def __init__(self):
        super().__init__('scan_restamper')
        qos = QoSProfile(depth=10)
        qos.reliability = ReliabilityPolicy.BEST_EFFORT  # match most lidars
        self.pub = self.create_publisher(LaserScan, '/fastbot/scan_restamped', qos)
        self.sub = self.create_subscription(LaserScan, '/fastbot/scan', self.cb, qos)

    def cb(self, msg: LaserScan):
        msg.header.stamp = self.get_clock().now().to_msg()
        self.pub.publish(msg)

def main():
    rclpy.init()
    node = Restamp()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()
