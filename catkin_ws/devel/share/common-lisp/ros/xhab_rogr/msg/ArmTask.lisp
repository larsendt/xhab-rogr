; Auto-generated. Do not edit!


(cl:in-package xhab_rogr-msg)


;//! \htmlinclude ArmTask.msg.html

(cl:defclass <ArmTask> (roslisp-msg-protocol:ros-message)
  ((shoulder1_angle
    :reader shoulder1_angle
    :initarg :shoulder1_angle
    :type cl:float
    :initform 0.0)
   (shoulder2_angle
    :reader shoulder2_angle
    :initarg :shoulder2_angle
    :type cl:float
    :initform 0.0)
   (elbow1_angle
    :reader elbow1_angle
    :initarg :elbow1_angle
    :type cl:float
    :initform 0.0)
   (elbow2_angle
    :reader elbow2_angle
    :initarg :elbow2_angle
    :type cl:float
    :initform 0.0)
   (wrist_angle
    :reader wrist_angle
    :initarg :wrist_angle
    :type cl:float
    :initform 0.0)
   (endeffector_angle
    :reader endeffector_angle
    :initarg :endeffector_angle
    :type cl:float
    :initform 0.0))
)

(cl:defclass ArmTask (<ArmTask>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ArmTask>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ArmTask)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name xhab_rogr-msg:<ArmTask> is deprecated: use xhab_rogr-msg:ArmTask instead.")))

(cl:ensure-generic-function 'shoulder1_angle-val :lambda-list '(m))
(cl:defmethod shoulder1_angle-val ((m <ArmTask>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xhab_rogr-msg:shoulder1_angle-val is deprecated.  Use xhab_rogr-msg:shoulder1_angle instead.")
  (shoulder1_angle m))

(cl:ensure-generic-function 'shoulder2_angle-val :lambda-list '(m))
(cl:defmethod shoulder2_angle-val ((m <ArmTask>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xhab_rogr-msg:shoulder2_angle-val is deprecated.  Use xhab_rogr-msg:shoulder2_angle instead.")
  (shoulder2_angle m))

(cl:ensure-generic-function 'elbow1_angle-val :lambda-list '(m))
(cl:defmethod elbow1_angle-val ((m <ArmTask>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xhab_rogr-msg:elbow1_angle-val is deprecated.  Use xhab_rogr-msg:elbow1_angle instead.")
  (elbow1_angle m))

(cl:ensure-generic-function 'elbow2_angle-val :lambda-list '(m))
(cl:defmethod elbow2_angle-val ((m <ArmTask>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xhab_rogr-msg:elbow2_angle-val is deprecated.  Use xhab_rogr-msg:elbow2_angle instead.")
  (elbow2_angle m))

(cl:ensure-generic-function 'wrist_angle-val :lambda-list '(m))
(cl:defmethod wrist_angle-val ((m <ArmTask>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xhab_rogr-msg:wrist_angle-val is deprecated.  Use xhab_rogr-msg:wrist_angle instead.")
  (wrist_angle m))

(cl:ensure-generic-function 'endeffector_angle-val :lambda-list '(m))
(cl:defmethod endeffector_angle-val ((m <ArmTask>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xhab_rogr-msg:endeffector_angle-val is deprecated.  Use xhab_rogr-msg:endeffector_angle instead.")
  (endeffector_angle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ArmTask>) ostream)
  "Serializes a message object of type '<ArmTask>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'shoulder1_angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'shoulder2_angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'elbow1_angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'elbow2_angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'wrist_angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'endeffector_angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ArmTask>) istream)
  "Deserializes a message object of type '<ArmTask>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'shoulder1_angle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'shoulder2_angle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'elbow1_angle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'elbow2_angle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'wrist_angle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'endeffector_angle) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ArmTask>)))
  "Returns string type for a message object of type '<ArmTask>"
  "xhab_rogr/ArmTask")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ArmTask)))
  "Returns string type for a message object of type 'ArmTask"
  "xhab_rogr/ArmTask")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ArmTask>)))
  "Returns md5sum for a message object of type '<ArmTask>"
  "032668acfa00b70c60776d883d042701")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ArmTask)))
  "Returns md5sum for a message object of type 'ArmTask"
  "032668acfa00b70c60776d883d042701")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ArmTask>)))
  "Returns full string definition for message of type '<ArmTask>"
  (cl:format cl:nil "float32 shoulder1_angle~%float32 shoulder2_angle~%float32 elbow1_angle~%float32 elbow2_angle~%float32 wrist_angle~%float32 endeffector_angle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ArmTask)))
  "Returns full string definition for message of type 'ArmTask"
  (cl:format cl:nil "float32 shoulder1_angle~%float32 shoulder2_angle~%float32 elbow1_angle~%float32 elbow2_angle~%float32 wrist_angle~%float32 endeffector_angle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ArmTask>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ArmTask>))
  "Converts a ROS message object to a list"
  (cl:list 'ArmTask
    (cl:cons ':shoulder1_angle (shoulder1_angle msg))
    (cl:cons ':shoulder2_angle (shoulder2_angle msg))
    (cl:cons ':elbow1_angle (elbow1_angle msg))
    (cl:cons ':elbow2_angle (elbow2_angle msg))
    (cl:cons ':wrist_angle (wrist_angle msg))
    (cl:cons ':endeffector_angle (endeffector_angle msg))
))
