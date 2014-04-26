; Auto-generated. Do not edit!


(cl:in-package xhab_rogr-msg)


;//! \htmlinclude CameraTurretTask.msg.html

(cl:defclass <CameraTurretTask> (roslisp-msg-protocol:ros-message)
  ((timestamp
    :reader timestamp
    :initarg :timestamp
    :type cl:real
    :initform 0))
)

(cl:defclass CameraTurretTask (<CameraTurretTask>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CameraTurretTask>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CameraTurretTask)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name xhab_rogr-msg:<CameraTurretTask> is deprecated: use xhab_rogr-msg:CameraTurretTask instead.")))

(cl:ensure-generic-function 'timestamp-val :lambda-list '(m))
(cl:defmethod timestamp-val ((m <CameraTurretTask>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xhab_rogr-msg:timestamp-val is deprecated.  Use xhab_rogr-msg:timestamp instead.")
  (timestamp m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<CameraTurretTask>)))
    "Constants for message type '<CameraTurretTask>"
  '((:SOURCE . rogr)
    (:TARGET . cameraturret))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'CameraTurretTask)))
    "Constants for message type 'CameraTurretTask"
  '((:SOURCE . rogr)
    (:TARGET . cameraturret))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CameraTurretTask>) ostream)
  "Serializes a message object of type '<CameraTurretTask>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CameraTurretTask>) istream)
  "Deserializes a message object of type '<CameraTurretTask>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CameraTurretTask>)))
  "Returns string type for a message object of type '<CameraTurretTask>"
  "xhab_rogr/CameraTurretTask")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CameraTurretTask)))
  "Returns string type for a message object of type 'CameraTurretTask"
  "xhab_rogr/CameraTurretTask")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CameraTurretTask>)))
  "Returns md5sum for a message object of type '<CameraTurretTask>"
  "2afab975218ba7b4bc3132f459999d45")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CameraTurretTask)))
  "Returns md5sum for a message object of type 'CameraTurretTask"
  "2afab975218ba7b4bc3132f459999d45")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CameraTurretTask>)))
  "Returns full string definition for message of type '<CameraTurretTask>"
  (cl:format cl:nil "string source = rogr~%string target = cameraturret~%time timestamp~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CameraTurretTask)))
  "Returns full string definition for message of type 'CameraTurretTask"
  (cl:format cl:nil "string source = rogr~%string target = cameraturret~%time timestamp~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CameraTurretTask>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CameraTurretTask>))
  "Converts a ROS message object to a list"
  (cl:list 'CameraTurretTask
    (cl:cons ':timestamp (timestamp msg))
))
