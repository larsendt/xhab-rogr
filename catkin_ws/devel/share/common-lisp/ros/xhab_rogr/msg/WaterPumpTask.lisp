; Auto-generated. Do not edit!


(cl:in-package xhab_rogr-msg)


;//! \htmlinclude WaterPumpTask.msg.html

(cl:defclass <WaterPumpTask> (roslisp-msg-protocol:ros-message)
  ((timestamp
    :reader timestamp
    :initarg :timestamp
    :type cl:real
    :initform 0)
   (pump_on
    :reader pump_on
    :initarg :pump_on
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass WaterPumpTask (<WaterPumpTask>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <WaterPumpTask>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'WaterPumpTask)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name xhab_rogr-msg:<WaterPumpTask> is deprecated: use xhab_rogr-msg:WaterPumpTask instead.")))

(cl:ensure-generic-function 'timestamp-val :lambda-list '(m))
(cl:defmethod timestamp-val ((m <WaterPumpTask>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xhab_rogr-msg:timestamp-val is deprecated.  Use xhab_rogr-msg:timestamp instead.")
  (timestamp m))

(cl:ensure-generic-function 'pump_on-val :lambda-list '(m))
(cl:defmethod pump_on-val ((m <WaterPumpTask>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xhab_rogr-msg:pump_on-val is deprecated.  Use xhab_rogr-msg:pump_on instead.")
  (pump_on m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<WaterPumpTask>)))
    "Constants for message type '<WaterPumpTask>"
  '((:SOURCE . rogr)
    (:TARGET . waterpump))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'WaterPumpTask)))
    "Constants for message type 'WaterPumpTask"
  '((:SOURCE . rogr)
    (:TARGET . waterpump))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <WaterPumpTask>) ostream)
  "Serializes a message object of type '<WaterPumpTask>"
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
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'pump_on) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <WaterPumpTask>) istream)
  "Deserializes a message object of type '<WaterPumpTask>"
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
    (cl:setf (cl:slot-value msg 'pump_on) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<WaterPumpTask>)))
  "Returns string type for a message object of type '<WaterPumpTask>"
  "xhab_rogr/WaterPumpTask")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'WaterPumpTask)))
  "Returns string type for a message object of type 'WaterPumpTask"
  "xhab_rogr/WaterPumpTask")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<WaterPumpTask>)))
  "Returns md5sum for a message object of type '<WaterPumpTask>"
  "adbc5842fc1e413aae4f07de4c020865")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'WaterPumpTask)))
  "Returns md5sum for a message object of type 'WaterPumpTask"
  "adbc5842fc1e413aae4f07de4c020865")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<WaterPumpTask>)))
  "Returns full string definition for message of type '<WaterPumpTask>"
  (cl:format cl:nil "string source = rogr~%string target = waterpump~%time timestamp~%bool pump_on~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'WaterPumpTask)))
  "Returns full string definition for message of type 'WaterPumpTask"
  (cl:format cl:nil "string source = rogr~%string target = waterpump~%time timestamp~%bool pump_on~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <WaterPumpTask>))
  (cl:+ 0
     8
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <WaterPumpTask>))
  "Converts a ROS message object to a list"
  (cl:list 'WaterPumpTask
    (cl:cons ':timestamp (timestamp msg))
    (cl:cons ':pump_on (pump_on msg))
))
