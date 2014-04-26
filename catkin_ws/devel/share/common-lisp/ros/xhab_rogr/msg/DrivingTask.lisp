; Auto-generated. Do not edit!


(cl:in-package xhab_rogr-msg)


;//! \htmlinclude DrivingTask.msg.html

(cl:defclass <DrivingTask> (roslisp-msg-protocol:ros-message)
  ((timestamp
    :reader timestamp
    :initarg :timestamp
    :type cl:real
    :initform 0)
   (trans_x
    :reader trans_x
    :initarg :trans_x
    :type cl:float
    :initform 0.0)
   (trans_y
    :reader trans_y
    :initarg :trans_y
    :type cl:float
    :initform 0.0)
   (rot
    :reader rot
    :initarg :rot
    :type cl:float
    :initform 0.0))
)

(cl:defclass DrivingTask (<DrivingTask>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DrivingTask>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DrivingTask)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name xhab_rogr-msg:<DrivingTask> is deprecated: use xhab_rogr-msg:DrivingTask instead.")))

(cl:ensure-generic-function 'timestamp-val :lambda-list '(m))
(cl:defmethod timestamp-val ((m <DrivingTask>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xhab_rogr-msg:timestamp-val is deprecated.  Use xhab_rogr-msg:timestamp instead.")
  (timestamp m))

(cl:ensure-generic-function 'trans_x-val :lambda-list '(m))
(cl:defmethod trans_x-val ((m <DrivingTask>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xhab_rogr-msg:trans_x-val is deprecated.  Use xhab_rogr-msg:trans_x instead.")
  (trans_x m))

(cl:ensure-generic-function 'trans_y-val :lambda-list '(m))
(cl:defmethod trans_y-val ((m <DrivingTask>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xhab_rogr-msg:trans_y-val is deprecated.  Use xhab_rogr-msg:trans_y instead.")
  (trans_y m))

(cl:ensure-generic-function 'rot-val :lambda-list '(m))
(cl:defmethod rot-val ((m <DrivingTask>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xhab_rogr-msg:rot-val is deprecated.  Use xhab_rogr-msg:rot instead.")
  (rot m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<DrivingTask>)))
    "Constants for message type '<DrivingTask>"
  '((:SOURCE . rogr)
    (:TARGET . drivingmechanism))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'DrivingTask)))
    "Constants for message type 'DrivingTask"
  '((:SOURCE . rogr)
    (:TARGET . drivingmechanism))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DrivingTask>) ostream)
  "Serializes a message object of type '<DrivingTask>"
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
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'trans_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'trans_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'rot))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DrivingTask>) istream)
  "Deserializes a message object of type '<DrivingTask>"
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
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'trans_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'trans_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'rot) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DrivingTask>)))
  "Returns string type for a message object of type '<DrivingTask>"
  "xhab_rogr/DrivingTask")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DrivingTask)))
  "Returns string type for a message object of type 'DrivingTask"
  "xhab_rogr/DrivingTask")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DrivingTask>)))
  "Returns md5sum for a message object of type '<DrivingTask>"
  "25794bc2e5cd06007a6b358f4e2131b4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DrivingTask)))
  "Returns md5sum for a message object of type 'DrivingTask"
  "25794bc2e5cd06007a6b358f4e2131b4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DrivingTask>)))
  "Returns full string definition for message of type '<DrivingTask>"
  (cl:format cl:nil "string source = rogr~%string target = drivingmechanism~%time timestamp~%float32 trans_x~%float32 trans_y~%float32 rot~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DrivingTask)))
  "Returns full string definition for message of type 'DrivingTask"
  (cl:format cl:nil "string source = rogr~%string target = drivingmechanism~%time timestamp~%float32 trans_x~%float32 trans_y~%float32 rot~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DrivingTask>))
  (cl:+ 0
     8
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DrivingTask>))
  "Converts a ROS message object to a list"
  (cl:list 'DrivingTask
    (cl:cons ':timestamp (timestamp msg))
    (cl:cons ':trans_x (trans_x msg))
    (cl:cons ':trans_y (trans_y msg))
    (cl:cons ':rot (rot msg))
))
