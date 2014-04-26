; Auto-generated. Do not edit!


(cl:in-package xhab_rogr-msg)


;//! \htmlinclude LiftingTask.msg.html

(cl:defclass <LiftingTask> (roslisp-msg-protocol:ros-message)
  ((timestamp
    :reader timestamp
    :initarg :timestamp
    :type cl:real
    :initform 0)
   (lift
    :reader lift
    :initarg :lift
    :type cl:float
    :initform 0.0))
)

(cl:defclass LiftingTask (<LiftingTask>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LiftingTask>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LiftingTask)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name xhab_rogr-msg:<LiftingTask> is deprecated: use xhab_rogr-msg:LiftingTask instead.")))

(cl:ensure-generic-function 'timestamp-val :lambda-list '(m))
(cl:defmethod timestamp-val ((m <LiftingTask>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xhab_rogr-msg:timestamp-val is deprecated.  Use xhab_rogr-msg:timestamp instead.")
  (timestamp m))

(cl:ensure-generic-function 'lift-val :lambda-list '(m))
(cl:defmethod lift-val ((m <LiftingTask>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xhab_rogr-msg:lift-val is deprecated.  Use xhab_rogr-msg:lift instead.")
  (lift m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<LiftingTask>)))
    "Constants for message type '<LiftingTask>"
  '((:SOURCE . rogr)
    (:TARGET . liftingmechanism))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'LiftingTask)))
    "Constants for message type 'LiftingTask"
  '((:SOURCE . rogr)
    (:TARGET . liftingmechanism))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LiftingTask>) ostream)
  "Serializes a message object of type '<LiftingTask>"
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
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'lift))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LiftingTask>) istream)
  "Deserializes a message object of type '<LiftingTask>"
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
    (cl:setf (cl:slot-value msg 'lift) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LiftingTask>)))
  "Returns string type for a message object of type '<LiftingTask>"
  "xhab_rogr/LiftingTask")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LiftingTask)))
  "Returns string type for a message object of type 'LiftingTask"
  "xhab_rogr/LiftingTask")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LiftingTask>)))
  "Returns md5sum for a message object of type '<LiftingTask>"
  "33b2086859756e0708f10b97c609fdce")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LiftingTask)))
  "Returns md5sum for a message object of type 'LiftingTask"
  "33b2086859756e0708f10b97c609fdce")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LiftingTask>)))
  "Returns full string definition for message of type '<LiftingTask>"
  (cl:format cl:nil "string source = rogr~%string target = liftingmechanism~%time timestamp~%float32 lift~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LiftingTask)))
  "Returns full string definition for message of type 'LiftingTask"
  (cl:format cl:nil "string source = rogr~%string target = liftingmechanism~%time timestamp~%float32 lift~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LiftingTask>))
  (cl:+ 0
     8
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LiftingTask>))
  "Converts a ROS message object to a list"
  (cl:list 'LiftingTask
    (cl:cons ':timestamp (timestamp msg))
    (cl:cons ':lift (lift msg))
))
