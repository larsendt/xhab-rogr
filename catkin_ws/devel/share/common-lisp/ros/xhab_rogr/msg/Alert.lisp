; Auto-generated. Do not edit!


(cl:in-package xhab_rogr-msg)


;//! \htmlinclude Alert.msg.html

(cl:defclass <Alert> (roslisp-msg-protocol:ros-message)
  ((alert_text
    :reader alert_text
    :initarg :alert_text
    :type cl:string
    :initform "")
   (timestamp
    :reader timestamp
    :initarg :timestamp
    :type cl:real
    :initform 0))
)

(cl:defclass Alert (<Alert>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Alert>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Alert)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name xhab_rogr-msg:<Alert> is deprecated: use xhab_rogr-msg:Alert instead.")))

(cl:ensure-generic-function 'alert_text-val :lambda-list '(m))
(cl:defmethod alert_text-val ((m <Alert>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xhab_rogr-msg:alert_text-val is deprecated.  Use xhab_rogr-msg:alert_text instead.")
  (alert_text m))

(cl:ensure-generic-function 'timestamp-val :lambda-list '(m))
(cl:defmethod timestamp-val ((m <Alert>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xhab_rogr-msg:timestamp-val is deprecated.  Use xhab_rogr-msg:timestamp instead.")
  (timestamp m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<Alert>)))
    "Constants for message type '<Alert>"
  '((:SOURCE . rogr))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'Alert)))
    "Constants for message type 'Alert"
  '((:SOURCE . rogr))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Alert>) ostream)
  "Serializes a message object of type '<Alert>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'alert_text))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'alert_text))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Alert>) istream)
  "Deserializes a message object of type '<Alert>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'alert_text) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'alert_text) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Alert>)))
  "Returns string type for a message object of type '<Alert>"
  "xhab_rogr/Alert")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Alert)))
  "Returns string type for a message object of type 'Alert"
  "xhab_rogr/Alert")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Alert>)))
  "Returns md5sum for a message object of type '<Alert>"
  "7c7125abb9c4eaf57915dd2511e663cf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Alert)))
  "Returns md5sum for a message object of type 'Alert"
  "7c7125abb9c4eaf57915dd2511e663cf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Alert>)))
  "Returns full string definition for message of type '<Alert>"
  (cl:format cl:nil "string source = rogr~%string alert_text~%time timestamp~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Alert)))
  "Returns full string definition for message of type 'Alert"
  (cl:format cl:nil "string source = rogr~%string alert_text~%time timestamp~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Alert>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'alert_text))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Alert>))
  "Converts a ROS message object to a list"
  (cl:list 'Alert
    (cl:cons ':alert_text (alert_text msg))
    (cl:cons ':timestamp (timestamp msg))
))
