; Auto-generated. Do not edit!


(cl:in-package xhab_rogr-msg)


;//! \htmlinclude ArmCameraTask.msg.html

(cl:defclass <ArmCameraTask> (roslisp-msg-protocol:ros-message)
  ((timestamp
    :reader timestamp
    :initarg :timestamp
    :type cl:real
    :initform 0)
   (camera_on
    :reader camera_on
    :initarg :camera_on
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ArmCameraTask (<ArmCameraTask>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ArmCameraTask>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ArmCameraTask)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name xhab_rogr-msg:<ArmCameraTask> is deprecated: use xhab_rogr-msg:ArmCameraTask instead.")))

(cl:ensure-generic-function 'timestamp-val :lambda-list '(m))
(cl:defmethod timestamp-val ((m <ArmCameraTask>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xhab_rogr-msg:timestamp-val is deprecated.  Use xhab_rogr-msg:timestamp instead.")
  (timestamp m))

(cl:ensure-generic-function 'camera_on-val :lambda-list '(m))
(cl:defmethod camera_on-val ((m <ArmCameraTask>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xhab_rogr-msg:camera_on-val is deprecated.  Use xhab_rogr-msg:camera_on instead.")
  (camera_on m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<ArmCameraTask>)))
    "Constants for message type '<ArmCameraTask>"
  '((:SOURCE . rogr)
    (:TARGET . armcamera))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'ArmCameraTask)))
    "Constants for message type 'ArmCameraTask"
  '((:SOURCE . rogr)
    (:TARGET . armcamera))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ArmCameraTask>) ostream)
  "Serializes a message object of type '<ArmCameraTask>"
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
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'camera_on) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ArmCameraTask>) istream)
  "Deserializes a message object of type '<ArmCameraTask>"
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
    (cl:setf (cl:slot-value msg 'camera_on) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ArmCameraTask>)))
  "Returns string type for a message object of type '<ArmCameraTask>"
  "xhab_rogr/ArmCameraTask")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ArmCameraTask)))
  "Returns string type for a message object of type 'ArmCameraTask"
  "xhab_rogr/ArmCameraTask")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ArmCameraTask>)))
  "Returns md5sum for a message object of type '<ArmCameraTask>"
  "a47551228b7aa330a6e76cc4496b9738")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ArmCameraTask)))
  "Returns md5sum for a message object of type 'ArmCameraTask"
  "a47551228b7aa330a6e76cc4496b9738")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ArmCameraTask>)))
  "Returns full string definition for message of type '<ArmCameraTask>"
  (cl:format cl:nil "string source = rogr~%string target = armcamera~%time timestamp~%bool camera_on~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ArmCameraTask)))
  "Returns full string definition for message of type 'ArmCameraTask"
  (cl:format cl:nil "string source = rogr~%string target = armcamera~%time timestamp~%bool camera_on~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ArmCameraTask>))
  (cl:+ 0
     8
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ArmCameraTask>))
  "Converts a ROS message object to a list"
  (cl:list 'ArmCameraTask
    (cl:cons ':timestamp (timestamp msg))
    (cl:cons ':camera_on (camera_on msg))
))
