; Auto-generated. Do not edit!


(cl:in-package xhab_rogr-msg)


;//! \htmlinclude NutrientPumpTask.msg.html

(cl:defclass <NutrientPumpTask> (roslisp-msg-protocol:ros-message)
  ((timestamp
    :reader timestamp
    :initarg :timestamp
    :type cl:real
    :initform 0)
   (pump_on
    :reader pump_on
    :initarg :pump_on
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass NutrientPumpTask (<NutrientPumpTask>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <NutrientPumpTask>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'NutrientPumpTask)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name xhab_rogr-msg:<NutrientPumpTask> is deprecated: use xhab_rogr-msg:NutrientPumpTask instead.")))

(cl:ensure-generic-function 'timestamp-val :lambda-list '(m))
(cl:defmethod timestamp-val ((m <NutrientPumpTask>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xhab_rogr-msg:timestamp-val is deprecated.  Use xhab_rogr-msg:timestamp instead.")
  (timestamp m))

(cl:ensure-generic-function 'pump_on-val :lambda-list '(m))
(cl:defmethod pump_on-val ((m <NutrientPumpTask>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xhab_rogr-msg:pump_on-val is deprecated.  Use xhab_rogr-msg:pump_on instead.")
  (pump_on m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<NutrientPumpTask>)))
    "Constants for message type '<NutrientPumpTask>"
  '((:SOURCE . rogr)
    (:TARGET . nutrientpump))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'NutrientPumpTask)))
    "Constants for message type 'NutrientPumpTask"
  '((:SOURCE . rogr)
    (:TARGET . nutrientpump))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <NutrientPumpTask>) ostream)
  "Serializes a message object of type '<NutrientPumpTask>"
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
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'pump_on) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <NutrientPumpTask>) istream)
  "Deserializes a message object of type '<NutrientPumpTask>"
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
    (cl:setf (cl:slot-value msg 'pump_on) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<NutrientPumpTask>)))
  "Returns string type for a message object of type '<NutrientPumpTask>"
  "xhab_rogr/NutrientPumpTask")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'NutrientPumpTask)))
  "Returns string type for a message object of type 'NutrientPumpTask"
  "xhab_rogr/NutrientPumpTask")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<NutrientPumpTask>)))
  "Returns md5sum for a message object of type '<NutrientPumpTask>"
  "0fef2aca0def204b408d2365c7b39566")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'NutrientPumpTask)))
  "Returns md5sum for a message object of type 'NutrientPumpTask"
  "0fef2aca0def204b408d2365c7b39566")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<NutrientPumpTask>)))
  "Returns full string definition for message of type '<NutrientPumpTask>"
  (cl:format cl:nil "string source = rogr~%string target = nutrientpump~%time timestamp~%bool pump_on~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'NutrientPumpTask)))
  "Returns full string definition for message of type 'NutrientPumpTask"
  (cl:format cl:nil "string source = rogr~%string target = nutrientpump~%time timestamp~%bool pump_on~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <NutrientPumpTask>))
  (cl:+ 0
     8
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <NutrientPumpTask>))
  "Converts a ROS message object to a list"
  (cl:list 'NutrientPumpTask
    (cl:cons ':timestamp (timestamp msg))
    (cl:cons ':pump_on (pump_on msg))
))
