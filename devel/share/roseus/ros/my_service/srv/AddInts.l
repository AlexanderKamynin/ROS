;; Auto-generated. Do not edit!


(when (boundp 'my_service::AddInts)
  (if (not (find-package "MY_SERVICE"))
    (make-package "MY_SERVICE"))
  (shadow 'AddInts (find-package "MY_SERVICE")))
(unless (find-package "MY_SERVICE::ADDINTS")
  (make-package "MY_SERVICE::ADDINTS"))
(unless (find-package "MY_SERVICE::ADDINTSREQUEST")
  (make-package "MY_SERVICE::ADDINTSREQUEST"))
(unless (find-package "MY_SERVICE::ADDINTSRESPONSE")
  (make-package "MY_SERVICE::ADDINTSRESPONSE"))

(in-package "ROS")





(defclass my_service::AddIntsRequest
  :super ros::object
  :slots (_first _second ))

(defmethod my_service::AddIntsRequest
  (:init
   (&key
    ((:first __first) "")
    ((:second __second) "")
    )
   (send-super :init)
   (setq _first (string __first))
   (setq _second (string __second))
   self)
  (:first
   (&optional __first)
   (if __first (setq _first __first)) _first)
  (:second
   (&optional __second)
   (if __second (setq _second __second)) _second)
  (:serialization-length
   ()
   (+
    ;; string _first
    4 (length _first)
    ;; string _second
    4 (length _second)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _first
       (write-long (length _first) s) (princ _first s)
     ;; string _second
       (write-long (length _second) s) (princ _second s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _first
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _first (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _second
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _second (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass my_service::AddIntsResponse
  :super ros::object
  :slots (_sum ))

(defmethod my_service::AddIntsResponse
  (:init
   (&key
    ((:sum __sum) "")
    )
   (send-super :init)
   (setq _sum (string __sum))
   self)
  (:sum
   (&optional __sum)
   (if __sum (setq _sum __sum)) _sum)
  (:serialization-length
   ()
   (+
    ;; string _sum
    4 (length _sum)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _sum
       (write-long (length _sum) s) (princ _sum s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _sum
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _sum (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass my_service::AddInts
  :super ros::object
  :slots ())

(setf (get my_service::AddInts :md5sum-) "d8ca4ab69fad67fcd8906ca3e09c53af")
(setf (get my_service::AddInts :datatype-) "my_service/AddInts")
(setf (get my_service::AddInts :request) my_service::AddIntsRequest)
(setf (get my_service::AddInts :response) my_service::AddIntsResponse)

(defmethod my_service::AddIntsRequest
  (:response () (instance my_service::AddIntsResponse :init)))

(setf (get my_service::AddIntsRequest :md5sum-) "d8ca4ab69fad67fcd8906ca3e09c53af")
(setf (get my_service::AddIntsRequest :datatype-) "my_service/AddIntsRequest")
(setf (get my_service::AddIntsRequest :definition-)
      "string first
string second
---
string sum
")

(setf (get my_service::AddIntsResponse :md5sum-) "d8ca4ab69fad67fcd8906ca3e09c53af")
(setf (get my_service::AddIntsResponse :datatype-) "my_service/AddIntsResponse")
(setf (get my_service::AddIntsResponse :definition-)
      "string first
string second
---
string sum
")



(provide :my_service/AddInts "d8ca4ab69fad67fcd8906ca3e09c53af")


