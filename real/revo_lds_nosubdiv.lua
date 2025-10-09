include "revo_lds.lua"
options.num_subdivisions_per_laser_scan = 1   -- <— must be here (top-level)
options.tracking_frame = "base_link"
options.published_frame = "base_link"
options.odom_frame = "odom"
TRAJECTORY_BUILDER_2D.use_imu_data = false
return options
