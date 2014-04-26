; Auto-generated. Do not edit!


(cl:in-package xhab_rogr-msg)


;//! \htmlinclude NutrientTankTask.msg.html

(cl:defclass <NutrientTankTask> (roslisp-msg-protocol:ros-message)
  ((timestamp
    :reader timestamp
    :initarg :timestamp
    :type cl:real
    :initform 0))
)

(cl:defclass NutrientTankTask (<NutrientTankTask>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <NutrientTankTask>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'NutrientTankTask)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name xhab_rogr-msg:<NutrientTankTask> is deprecated: use xhab_rogr-msg:NutrientTankTask instead.")))

(cl:ensure-generic-function 'timestamp-val :lambda-list '(m))
(cl:defmethod timestamp-val ((m <NutrientTankTask>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xhab_rogr-msg:timestamp-val is deprecated.  Use xhab_rogr-msg:timestamp instead.")
  (timestamp m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<NutrientTankTask>)))
    "Constants for message type '<NutrientTankTask>"
  '((:SOURCE . rogr)
    (:TARGET . nutrienttank))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'NutrientTankTask)))
    "Constants for message type 'NutrientTankTask"
  '((:SOURCE . rogr)
    (:TARGET . nutrienttank))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <NutrientTankTask>) ostream)
  "Serializes a message object of type '<NutrientTankTask>"
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'timestamp)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'timestamp) (cl:floor (cl:slot-value msg 'timestamp)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <NutrientTankTask>) istream)
  "Deserializes a message object of type '<NutrientTankTask>"
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'timestamp) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<NutrientTankTask>)))
  "Returns string type for a message object of type '<NutrientTankTask>"
  "xhab_rogr/NutrientTankTask")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'NutrientTankTask)))
  "Returns string type for a message object of type 'NutrientTankTask"
  "xhab_rogr/NutrientTankTask")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<NutrientTankTask>)))
  "Returns md5sum for a message object of type '<NutrientTankTask>"
  "f7922e77fda2948a68a7c31af6dc31f0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'NutrientTankTask)))
  "Returns md5sum for a message object of type 'NutrientTankTask"
  "f7922e77fda2948a68a7c31af6dc31f0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<NutrientTankTask>)))
  "Returns full string definition for message of type '<NutrientTankTask>"
  (cl:format cl:nil "string source = rogr~%string target = nutrienttank~%time timestamp~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'NutrientTankTask)))
  "Returns full string definition for message of type 'NutrientTankTask"
  (cl:format cl:nil "string source = rogr~%string target = nutrienttank~%time timestamp~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <NutrientTankTask>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <NutrientTankTask>))
  "Converts a ROS message object to a list"
  (cl:list 'NutrientTankTask
    (cl:cons ':timestamp (timestamp msg))
))
