; Auto-generated. Do not edit!


(cl:in-package xhab_rogr-msg)


;//! \htmlinclude Camera2Task.msg.html

(cl:defclass <Camera2Task> (roslisp-msg-protocol:ros-message)
  ((timestamp
    :reader timestamp
    :initarg :timestamp
    :type cl:real
    :initform 0))
)

(cl:defclass Camera2Task (<Camera2Task>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Camera2Task>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Camera2Task)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name xhab_rogr-msg:<Camera2Task> is deprecated: use xhab_rogr-msg:Camera2Task instead.")))

(cl:ensure-generic-function 'timestamp-val :lambda-list '(m))
(cl:defmethod timestamp-val ((m <Camera2Task>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xhab_rogr-msg:timestamp-val is deprecated.  Use xhab_rogr-msg:timestamp instead.")
  (timestamp m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<Camera2Task>)))
    "Constants for message type '<Camera2Task>"
  '((:SOURCE . rogr)
    (:TARGET . camera2))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'Camera2Task)))
    "Constants for message type 'Camera2Task"
  '((:SOURCE . rogr)
    (:TARGET . camera2))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Camera2Task>) ostream)
  "Serializes a message object of type '<Camera2Task>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Camera2Task>) istream)
  "Deserializes a message object of type '<Camera2Task>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Camera2Task>)))
  "Returns string type for a message object of type '<Camera2Task>"
  "xhab_rogr/Camera2Task")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Camera2Task)))
  "Returns string type for a message object of type 'Camera2Task"
  "xhab_rogr/Camera2Task")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Camera2Task>)))
  "Returns md5sum for a message object of type '<Camera2Task>"
  "daf313cddc3278555b411808e81eb879")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Camera2Task)))
  "Returns md5sum for a message object of type 'Camera2Task"
  "daf313cddc3278555b411808e81eb879")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Camera2Task>)))
  "Returns full string definition for message of type '<Camera2Task>"
  (cl:format cl:nil "string source = rogr~%string target = camera2~%time timestamp~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Camera2Task)))
  "Returns full string definition for message of type 'Camera2Task"
  (cl:format cl:nil "string source = rogr~%string target = camera2~%time timestamp~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Camera2Task>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Camera2Task>))
  "Converts a ROS message object to a list"
  (cl:list 'Camera2Task
    (cl:cons ':timestamp (timestamp msg))
))
