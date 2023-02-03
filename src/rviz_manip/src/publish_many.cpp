#include <ros/ros.h>
#include <visualization_msgs/Marker.h>


int main(int argc, char **argv){
    ros::init(argc, argv, "point_publisher");
    ros::NodeHandle n;
    ros::Publisher pub = n.advertise<visualization_msgs::Marker>("pt_topic", 10, true);
    ros::Rate r(30);
    double offset = 0;

    while(ros::ok()){
        visualization_msgs::Marker msg;
        msg.header.frame_id = "point_on_map";
        msg.header.stamp = ros::Time::now();
        msg.ns = "there_is_point"; //id и namespace
        msg.id = 0;
        msg.action = visualization_msgs::Marker::ADD; //add - добавить
        msg.pose.position.x = 5; //глобальные координаты множества точек
        msg.pose.position.z = 0;
    
        msg.type = visualization_msgs::Marker::POINTS; //набор отрисовываемых точек
        msg.scale.x = 0.5;
        msg.scale.y = 0.5;
        msg.color.r = 0.0;
        msg.color.g = 1.0;
        msg.color.b = 0.0;
        msg.color.a = 1.0;
        for (int x = -20; x <= 20; x++){
        geometry_msgs::Point p; //точки, задаваемые в множестве точек marker
            p.x = x;
            p.y = 2*sin(x+offset);
            p.z = 2*cos(x+offset);
            msg.points.push_back(p); //массив точек
        }
        pub.publish(msg);
        offset += 0.4;
        r.sleep(); //нужно для того, чтобы все запущенные параллельно процессы выполнились
    }
    return 0;
}