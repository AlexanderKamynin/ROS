; Auto-generated. Do not edit!


(cl:in-package my_message-msg)


;//! \htmlinclude my_msg.msg.html

(cl:defclass <my_msg> (roslisp-msg-protocol:ros-message)
  ((c
    :reader c
    :initarg :c
    :type cl:integer
    :initform 0)
   (a
    :reader a
    :initarg :a
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass my_msg (<my_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <my_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'my_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name my_message-msg:<my_msg> is deprecated: use my_message-msg:my_msg instead.")))

(cl:ensure-generic-function 'c-val :lambda-list '(m))
(cl:defmethod c-val ((m <my_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_message-msg:c-val is deprecated.  Use my_message-msg:c instead.")
  (c m))

(cl:ensure-generic-function 'a-val :lambda-list '(m))
(cl:defmethod a-val ((m <my_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_message-msg:a-val is deprecated.  Use my_message-msg:a instead.")
  (a m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <my_msg>) ostream)
  "Serializes a message object of type '<my_msg>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'c)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'a))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'a))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <my_msg>) istream)
  "Deserializes a message object of type '<my_msg>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'c)) (cl:read-byte istream))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'a) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'a)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<my_msg>)))
  "Returns string type for a message object of type '<my_msg>"
  "my_message/my_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'my_msg)))
  "Returns string type for a message object of type 'my_msg"
  "my_message/my_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<my_msg>)))
  "Returns md5sum for a message object of type '<my_msg>"
  "4d4c2dfb91017c753e032c2528ca3891")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'my_msg)))
  "Returns md5sum for a message object of type 'my_msg"
  "4d4c2dfb91017c753e032c2528ca3891")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<my_msg>)))
  "Returns full string definition for message of type '<my_msg>"
  (cl:format cl:nil "char c~%int32[] a~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'my_msg)))
  "Returns full string definition for message of type 'my_msg"
  (cl:format cl:nil "char c~%int32[] a~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <my_msg>))
  (cl:+ 0
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'a) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <my_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'my_msg
    (cl:cons ':c (c msg))
    (cl:cons ':a (a msg))
))
