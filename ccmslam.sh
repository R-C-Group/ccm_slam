#! /bin/bash

###############################################################
gnome-terminal -t "server" -x bash -c "roslaunch ccmslam Server.launch;exec bash;"
sleep 15
gnome-terminal -t "agent1" -x bash -c "roslaunch ccmslam Client0_euroc.launch;exec bash;"
gnome-terminal -t "agent2" -x bash -c "roslaunch ccmslam Client1_euroc.launch;exec bash;"
sleep 15
gnome-terminal -t "agentbag1" -x bash -c "cd /home/lzy-ink/ccmslam_ws/src/data;rosbag play MH_01_easy.bag --start 45;exec bash;"  #cd 数据集包所在的位置
gnome-terminal -t "agentbag2" -x bash -c "cd /home/lzy-ink/ccmslam_ws/src/data;rosbag play MH_02_easy.bag --start 35 /cam0/image_raw:=/cam0/image_raw1;exec bash;" #cd 数据集包所在的位置
sleep 15
gnome-terminal -t "rviz" -x bash -c "cd /home/lzy-ink/ccmslam_ws/src/ccm_slam/cslam ;rviz -d conf/rviz/ccmslam.rviz;exec bash;" 
#如果roscd报错的话就直接用cd
