; Auto-generated. Do not edit!


(cl:in-package xhab_rogr-msg)


;//! \htmlinclude BatteryTask.msg.html

(cl:defclass <BatteryTask> (roslisp-msg-protocol:ros-message)
  ((timestamp
    :reader timestamp
    :initarg :timestamp
    :type cl:real
    :initform 0)
   (charging_status
    :reader charging_status
    :initarg :charging_status
    :type cl:string
    :initform "")
   (battery_level
    :reader battery_level
    :initarg :battery_level
    :type cl:integer
    :initform 0))
)

(cl:defclass BatteryTask (<BatteryTask>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BatteryTask>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BatteryTask)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name xhab_rogr-msg:<BatteryTask> is deprecated: use xhab_rogr-msg:BatteryTask instead.")))

(cl:ensure-generic-function 'timestamp-val :lambda-list '(m))
(cl:defmethod timestamp-val ((m <BatteryTask>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xhab_rogr-msg:timestamp-val is deprecated.  Use xhab_rogr-msg:timestamp instead.")
  (timestamp m))

(cl:ensure-generic-function 'charging_status-val :lambda-list '(m))
(cl:defmethod charging_status-val ((m <BatteryTask>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xhab_rogr-msg:charging_status-val is deprecated.  Use xhab_rogr-msg:charging_status instead.")
  (charging_status m))

(cl:ensure-generic-function 'battery_level-val :lambda-list '(m))
(cl:defmethod battery_level-val ((m <BatteryTask>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xhab_rogr-msg:battery_level-val is deprecated.  Use xhab_rogr-msg:battery_level instead.")
  (battery_level m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<BatteryTask>)))
    "Constants for message type '<BatteryTask>"
  '((:SOURCE . rogr)
    (:TARGET . battery))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'BatteryTask)))
    "Constants for message type 'BatteryTask"
  '((:SOURCE . rogr)
    (:TARGET . battery))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BatteryTask>) ostream)
  "Serializes a message object of type '<BatteryTask>"
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
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'charging_status))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'charging_status))
  (cl:let* ((signed (cl:slot-value msg 'battery_level)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BatteryTask>) istream)
  "Deserializes a message object of type '<BatteryTask>"
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
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'charging_status) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'charging_status) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'battery_level) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BatteryTask>)))
  "Returns string type for a message object of type '<BatteryTask>"
  "xhab_rogr/BatteryTask")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BatteryTask)))
  "Returns string type for a message object of type 'BatteryTask"
  "xhab_rogr/BatteryTask")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BatteryTask>)))
  "Returns md5sum for a message object of type '<BatteryTask>"
  "544840aa1865a5056ff7ce619f1f67b1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BatteryTask)))
  "Returns md5sum for a message object of type 'BatteryTask"
  "544840aa1865a5056ff7ce619f1f67b1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BatteryTask>)))
  "Returns full string definition for message of type '<BatteryTask>"
  (cl:format cl:nil "string source = rogr~%string target = battery~%time timestamp~%string charging_status~%int32 battery_level~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BatteryTask)))
  "Returns full string definition for message of type 'BatteryTask"
  (cl:format cl:nil "string source = rogr~%string target = battery~%time timestamp~%string charging_status~%int32 battery_level~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BatteryTask>))
  (cl:+ 0
     8
     4 (cl:length (cl:slot-value msg 'charging_status))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BatteryTask>))
  "Converts a ROS message object to a list"
  (cl:list 'BatteryTask
    (cl:cons ':timestamp (timestamp msg))
    (cl:cons ':charging_status (charging_status msg))
    (cl:cons ':battery_level (battery_level msg))
))
