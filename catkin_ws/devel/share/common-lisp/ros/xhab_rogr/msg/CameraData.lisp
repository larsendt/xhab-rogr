; Auto-generated. Do not edit!


(cl:in-package xhab_rogr-msg)


;//! \htmlinclude CameraData.msg.html

(cl:defclass <CameraData> (roslisp-msg-protocol:ros-message)
  ((cameratype
    :reader cameratype
    :initarg :cameratype
    :type cl:string
    :initform "")
   (property
    :reader property
    :initarg :property
    :type cl:string
    :initform "")
   (timestamp
    :reader timestamp
    :initarg :timestamp
    :type cl:real
    :initform 0))
)

(cl:defclass CameraData (<CameraData>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CameraData>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CameraData)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name xhab_rogr-msg:<CameraData> is deprecated: use xhab_rogr-msg:CameraData instead.")))

(cl:ensure-generic-function 'cameratype-val :lambda-list '(m))
(cl:defmethod cameratype-val ((m <CameraData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xhab_rogr-msg:cameratype-val is deprecated.  Use xhab_rogr-msg:cameratype instead.")
  (cameratype m))

(cl:ensure-generic-function 'property-val :lambda-list '(m))
(cl:defmethod property-val ((m <CameraData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xhab_rogr-msg:property-val is deprecated.  Use xhab_rogr-msg:property instead.")
  (property m))

(cl:ensure-generic-function 'timestamp-val :lambda-list '(m))
(cl:defmethod timestamp-val ((m <CameraData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xhab_rogr-msg:timestamp-val is deprecated.  Use xhab_rogr-msg:timestamp instead.")
  (timestamp m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<CameraData>)))
    "Constants for message type '<CameraData>"
  '((:SOURCE . rogr))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'CameraData)))
    "Constants for message type 'CameraData"
  '((:SOURCE . rogr))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CameraData>) ostream)
  "Serializes a message object of type '<CameraData>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'cameratype))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'cameratype))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'property))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'property))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CameraData>) istream)
  "Deserializes a message object of type '<CameraData>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'cameratype) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'cameratype) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'property) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'property) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CameraData>)))
  "Returns string type for a message object of type '<CameraData>"
  "xhab_rogr/CameraData")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CameraData)))
  "Returns string type for a message object of type 'CameraData"
  "xhab_rogr/CameraData")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CameraData>)))
  "Returns md5sum for a message object of type '<CameraData>"
  "fc814f1eed2f0308fe40769e8dfcbb59")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CameraData)))
  "Returns md5sum for a message object of type 'CameraData"
  "fc814f1eed2f0308fe40769e8dfcbb59")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CameraData>)))
  "Returns full string definition for message of type '<CameraData>"
  (cl:format cl:nil "string source = rogr~%string cameratype~%string property~%time timestamp~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CameraData)))
  "Returns full string definition for message of type 'CameraData"
  (cl:format cl:nil "string source = rogr~%string cameratype~%string property~%time timestamp~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CameraData>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'cameratype))
     4 (cl:length (cl:slot-value msg 'property))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CameraData>))
  "Converts a ROS message object to a list"
  (cl:list 'CameraData
    (cl:cons ':cameratype (cameratype msg))
    (cl:cons ':property (property msg))
    (cl:cons ':timestamp (timestamp msg))
))
