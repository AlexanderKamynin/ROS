#include "ros/ros.h"
#include "geometry_msgs/Twist.h"


void receive(const geometry_msgs::Twist& movement){ //функция обрабатывающая новопришедшее сообщение
    //функция просто выводит сообщение
    //можно сделать и интереснее. Это учебный варWиант
    ROS_INFO("Got:\n"
            "1) pos.linear: x=%f y=%f z=%f\n"
            "2) pos.angular: x=%f y=%f z=%f\n",
            movement.linear.x, movement.linear.y, movement.linear.z,
            movement.angular.x, movement.angular.y, movement.angular.z); //выводит на экран это сообщение (в консоль)
    return;
}


int main(int argc, char **argv){
    ros::init(argc, argv, "listener");
    ros::NodeHandle n;
    ros::Subscriber sub = n.subscribe("/turtle1/cmd_vel", 1000, receive); //просто создаем топик как есть
    ros::spin(); //не отдает управление ноде дальше. Прервать можно только ros shut down или ctrl-C
    return 0;
}