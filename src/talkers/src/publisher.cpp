#include "ros/ros.h" // описаны базовые команды и функции рос
#include "geometry_msgs/Twist.h" // описан класс публикуемого сообщения

int main(int argc, char **argv){
    ros::init(argc, argv, "publisher"); //инициализирует основные параметры рос; 3 параметр - имя ноды (по умолчанию)
    ros::NodeHandle n;  //объект управляющий нодой
    ros::Publisher pub = n.advertise<geometry_msgs::Twist>("/turtle1/cmd_vel", 1000); //отправка сообщений в топики

    ros::Rate loop_rate(1); //скорость подачи сообщений в топик. 1 сообщение в секунду
    for (int t = 0; t < 20; t++){
        geometry_msgs::Twist pos; //непосредственно сообщение
        pos.linear.x = 1.5; 
        pos.angular.z = std::abs(2*sin(0.5*t)); // задание изменения угла поворота

        ROS_INFO("Move to position:\n"
                "1) pos.linear: x=%f y=%f z=%f\n"
                "2) pos.angular: x=%f y=%f z=%f\n",
                pos.linear.x, pos.linear.y, pos.linear.z,
                pos.angular.x, pos.angular.y, pos.angular.z); //выводит на экран это сообщение (в консоль)
        pub.publish(pos); //публикация сообщения
        loop_rate.sleep(); //подождать для сохранения скорости
    }
    ros::spinOnce(); //Вызывает все ожидающие запуска callback-и (например, на чтение из топика)
    return 0;
}