; Auto-generated. Do not edit!


(cl:in-package xhab_rogr-msg)


;//! \htmlinclude WaterTankTask.msg.html

(cl:defclass <WaterTankTask> (roslisp-msg-protocol:ros-message)
  ((timestamp
    :reader timestamp
    :initarg :timestamp
    :type cl:real
    :initform 0))
)

(cl:defclass WaterTankTask (<WaterTankTask>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <WaterTankTask>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'WaterTankTask)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name xhab_rogr-msg:<WaterTankTask> is deprecated: use xhab_rogr-msg:WaterTankTask instead.")))

(cl:ensure-generic-function 'timestamp-val :lambda-list '(m))
(cl:defmethod timestamp-val ((m <WaterTankTask>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xhab_rogr-msg:timestamp-val is deprecated.  Use xhab_rogr-msg:timestamp instead.")
  (timestamp m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<WaterTankTask>)))
    "Constants for message type '<WaterTankTask>"
  '((:SOURCE . rogr)
    (:TARGET . watertank))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'WaterTankTask)))
    "Constants for message type 'WaterTankTask"
  '((:SOURCE . rogr)
    (:TARGET . watertank))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <WaterTankTask>) ostream)
  "Serializes a message object of type '<WaterTankTask>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <WaterTankTask>) istream)
  "Deserializes a message object of type '<WaterTankTask>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<WaterTankTask>)))
  "Returns string type for a message object of type '<WaterTankTask>"
  "xhab_rogr/WaterTankTask")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'WaterTankTask)))
  "Returns string type for a message object of type 'WaterTankTask"
  "xhab_rogr/WaterTankTask")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<WaterTankTask>)))
  "Returns md5sum for a message object of type '<WaterTankTask>"
  "16bb903ad5a72cf3bd9ac755138fc4bc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'WaterTankTask)))
  "Returns md5sum for a message object of type 'WaterTankTask"
  "16bb903ad5a72cf3bd9ac755138fc4bc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<WaterTankTask>)))
  "Returns full string definition for message of type '<WaterTankTask>"
  (cl:format cl:nil "string source = rogr~%string target = watertank~%time timestamp~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'WaterTankTask)))
  "Returns full string definition for message of type 'WaterTankTask"
  (cl:format cl:nil "string source = rogr~%string target = watertank~%time timestamp~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <WaterTankTask>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <WaterTankTask>))
  "Converts a ROS message object to a list"
  (cl:list 'WaterTankTask
    (cl:cons ':timestamp (timestamp msg))
))
