;; Auto-generated. Do not edit!


(when (boundp 'my_message::my_msg)
  (if (not (find-package "MY_MESSAGE"))
    (make-package "MY_MESSAGE"))
  (shadow 'my_msg (find-package "MY_MESSAGE")))
(unless (find-package "MY_MESSAGE::MY_MSG")
  (make-package "MY_MESSAGE::MY_MSG"))

(in-package "ROS")
;;//! \htmlinclude my_msg.msg.html


(defclass my_message::my_msg
  :super ros::object
  :slots (_c _a ))

(defmethod my_message::my_msg
  (:init
   (&key
    ((:c __c) 0)
    ((:a __a) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _c (round __c))
   (setq _a __a)
   self)
  (:c
   (&optional __c)
   (if __c (setq _c __c)) _c)
  (:a
   (&optional __a)
   (if __a (setq _a __a)) _a)
  (:serialization-length
   ()
   (+
    ;; char _c
    1
    ;; int32[] _a
    (* 4    (length _a)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; char _c
       (write-byte _c s)
     ;; int32[] _a
     (write-long (length _a) s)
     (dotimes (i (length _a))
       (write-long (elt _a i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; char _c
     (setq _c (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; int32[] _a
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _a (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _a i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get my_message::my_msg :md5sum-) "4d4c2dfb91017c753e032c2528ca3891")
(setf (get my_message::my_msg :datatype-) "my_message/my_msg")
(setf (get my_message::my_msg :definition-)
      "char c
int32[] a
")



(provide :my_message/my_msg "4d4c2dfb91017c753e032c2528ca3891")


