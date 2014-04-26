; Auto-generated. Do not edit!


(cl:in-package xhab_rogr-msg)


;//! \htmlinclude Camera1Task.msg.html

(cl:defclass <Camera1Task> (roslisp-msg-protocol:ros-message)
  ((timestamp
    :reader timestamp
    :initarg :timestamp
    :type cl:real
    :initform 0))
)

(cl:defclass Camera1Task (<Camera1Task>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Camera1Task>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Camera1Task)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name xhab_rogr-msg:<Camera1Task> is deprecated: use xhab_rogr-msg:Camera1Task instead.")))

(cl:ensure-generic-function 'timestamp-val :lambda-list '(m))
(cl:defmethod timestamp-val ((m <Camera1Task>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xhab_rogr-msg:timestamp-val is deprecated.  Use xhab_rogr-msg:timestamp instead.")
  (timestamp m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<Camera1Task>)))
    "Constants for message type '<Camera1Task>"
  '((:SOURCE . rogr)
    (:TARGET . camera1))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'Camera1Task)))
    "Constants for message type 'Camera1Task"
  '((:SOURCE . rogr)
    (:TARGET . camera1))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Camera1Task>) ostream)
  "Serializes a message object of type '<Camera1Task>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Camera1Task>) istream)
  "Deserializes a message object of type '<Camera1Task>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Camera1Task>)))
  "Returns string type for a message object of type '<Camera1Task>"
  "xhab_rogr/Camera1Task")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Camera1Task)))
  "Returns string type for a message object of type 'Camera1Task"
  "xhab_rogr/Camera1Task")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Camera1Task>)))
  "Returns md5sum for a message object of type '<Camera1Task>"
  "fb84f0e5f350102896b350f3837193ea")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Camera1Task)))
  "Returns md5sum for a message object of type 'Camera1Task"
  "fb84f0e5f350102896b350f3837193ea")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Camera1Task>)))
  "Returns full string definition for message of type '<Camera1Task>"
  (cl:format cl:nil "string source = rogr~%string target = camera1~%time timestamp~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Camera1Task)))
  "Returns full string definition for message of type 'Camera1Task"
  (cl:format cl:nil "string source = rogr~%string target = camera1~%time timestamp~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Camera1Task>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Camera1Task>))
  "Converts a ROS message object to a list"
  (cl:list 'Camera1Task
    (cl:cons ':timestamp (timestamp msg))
))
