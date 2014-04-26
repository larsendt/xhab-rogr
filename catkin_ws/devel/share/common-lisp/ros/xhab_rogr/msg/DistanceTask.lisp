; Auto-generated. Do not edit!


(cl:in-package xhab_rogr-msg)


;//! \htmlinclude DistanceTask.msg.html

(cl:defclass <DistanceTask> (roslisp-msg-protocol:ros-message)
  ((sensor_id
    :reader sensor_id
    :initarg :sensor_id
    :type cl:fixnum
    :initform 0)
   (timestamp
    :reader timestamp
    :initarg :timestamp
    :type cl:real
    :initform 0))
)

(cl:defclass DistanceTask (<DistanceTask>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DistanceTask>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DistanceTask)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name xhab_rogr-msg:<DistanceTask> is deprecated: use xhab_rogr-msg:DistanceTask instead.")))

(cl:ensure-generic-function 'sensor_id-val :lambda-list '(m))
(cl:defmethod sensor_id-val ((m <DistanceTask>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xhab_rogr-msg:sensor_id-val is deprecated.  Use xhab_rogr-msg:sensor_id instead.")
  (sensor_id m))

(cl:ensure-generic-function 'timestamp-val :lambda-list '(m))
(cl:defmethod timestamp-val ((m <DistanceTask>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xhab_rogr-msg:timestamp-val is deprecated.  Use xhab_rogr-msg:timestamp instead.")
  (timestamp m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<DistanceTask>)))
    "Constants for message type '<DistanceTask>"
  '((:SOURCE . rogr)
    (:TARGET . distancesensor))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'DistanceTask)))
    "Constants for message type 'DistanceTask"
  '((:SOURCE . rogr)
    (:TARGET . distancesensor))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DistanceTask>) ostream)
  "Serializes a message object of type '<DistanceTask>"
  (cl:let* ((signed (cl:slot-value msg 'sensor_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DistanceTask>) istream)
  "Deserializes a message object of type '<DistanceTask>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sensor_id) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DistanceTask>)))
  "Returns string type for a message object of type '<DistanceTask>"
  "xhab_rogr/DistanceTask")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DistanceTask)))
  "Returns string type for a message object of type 'DistanceTask"
  "xhab_rogr/DistanceTask")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DistanceTask>)))
  "Returns md5sum for a message object of type '<DistanceTask>"
  "c6964fbdb4067aa74d53a5f3467635b5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DistanceTask)))
  "Returns md5sum for a message object of type 'DistanceTask"
  "c6964fbdb4067aa74d53a5f3467635b5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DistanceTask>)))
  "Returns full string definition for message of type '<DistanceTask>"
  (cl:format cl:nil "string source = rogr~%string target = distancesensor~%int8 sensor_id~%time timestamp~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DistanceTask)))
  "Returns full string definition for message of type 'DistanceTask"
  (cl:format cl:nil "string source = rogr~%string target = distancesensor~%int8 sensor_id~%time timestamp~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DistanceTask>))
  (cl:+ 0
     1
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DistanceTask>))
  "Converts a ROS message object to a list"
  (cl:list 'DistanceTask
    (cl:cons ':sensor_id (sensor_id msg))
    (cl:cons ':timestamp (timestamp msg))
))
