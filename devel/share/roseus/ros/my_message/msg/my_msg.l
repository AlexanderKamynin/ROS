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
    ;; int64[] _a
    (* 8    (length _a)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; char _c
       (write-byte _c s)
     ;; int64[] _a
     (write-long (length _a) s)
     (dotimes (i (length _a))
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke (elt _a i) (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class (elt _a i)) (= (length ((elt _a i) . bv)) 2)) ;; bignum
              (write-long (ash (elt ((elt _a i) . bv) 0) 0) s)
              (write-long (ash (elt ((elt _a i) . bv) 1) -1) s))
             ((and (class (elt _a i)) (= (length ((elt _a i) . bv)) 1)) ;; big1
              (write-long (elt ((elt _a i) . bv) 0) s)
              (write-long (if (>= (elt _a i) 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long (elt _a i) s)(write-long (if (>= (elt _a i) 0) 0 #xffffffff) s)))
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; char _c
     (setq _c (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; int64[] _a
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _a (instantiate integer-vector n))
     (dotimes (i n)
#+(or :alpha :irix6 :x86_64)
      (setf (elt _a i) (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf (elt _a i) (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
     ))
   ;;
   self)
  )

(setf (get my_message::my_msg :md5sum-) "01bd265c1d029ea218ce44ea3c9c2cad")
(setf (get my_message::my_msg :datatype-) "my_message/my_msg")
(setf (get my_message::my_msg :definition-)
      "char c
int64[] a
")



(provide :my_message/my_msg "01bd265c1d029ea218ce44ea3c9c2cad")


