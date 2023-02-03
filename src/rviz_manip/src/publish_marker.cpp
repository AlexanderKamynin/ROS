#include <ros/ros.h>
#include <visualization_msgs/Marker.h>


int main(int argc, char **argv){
    ros::init(argc, argv, "point_publisher");
    ros::NodeHandle n;
    ros::Publisher pub = n.advertise<visualization_msgs::Marker>("pt_topic", 10, true);
    visualization_msgs::Marker mrk; //создаем сообщение, а не сам маркер

    mrk.header.frame_id = "point_on_map";
    mrk.header.stamp = ros::Time::now();
    mrk.ns = "there_is_point"; //id и namespace
    mrk.id = 0;
    mrk.action = visualization_msgs::Marker::ADD; //add - добавить

    mrk.type = visualization_msgs::Marker::POINTS; //набор отрисовываемых точек
    mrk.scale.x = 0.5;
    mrk.scale.y = 0.5;
    mrk.color.r = 1.0;
    mrk.color.g = 0.0;
    mrk.color.b = 0.0;
    mrk.color.a = 1.0;
    geometry_msgs::Point p; //точки, задаваемые в множестве точек marker
    p.x = 10;
    p.y = 10;
    p.z = 5;
    mrk.points.push_back(p); //массив точек
    pub.publish(mrk);
    sleep(1); //нужно для того, чтобы все запущенные параллельно процессы выполнились
    return 0;
}