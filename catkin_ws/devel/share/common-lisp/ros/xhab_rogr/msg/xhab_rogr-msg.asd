
(cl:in-package :asdf)

(defsystem "xhab_rogr-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "WaterPumpTask" :depends-on ("_package_WaterPumpTask"))
    (:file "_package_WaterPumpTask" :depends-on ("_package"))
    (:file "BatteryTask" :depends-on ("_package_BatteryTask"))
    (:file "_package_BatteryTask" :depends-on ("_package"))
    (:file "Data" :depends-on ("_package_Data"))
    (:file "_package_Data" :depends-on ("_package"))
    (:file "CameraTurretTask" :depends-on ("_package_CameraTurretTask"))
    (:file "_package_CameraTurretTask" :depends-on ("_package"))
    (:file "DistanceTask" :depends-on ("_package_DistanceTask"))
    (:file "_package_DistanceTask" :depends-on ("_package"))
    (:file "NutrientTankTask" :depends-on ("_package_NutrientTankTask"))
    (:file "_package_NutrientTankTask" :depends-on ("_package"))
    (:file "ArmTask" :depends-on ("_package_ArmTask"))
    (:file "_package_ArmTask" :depends-on ("_package"))
    (:file "Distance" :depends-on ("_package_Distance"))
    (:file "_package_Distance" :depends-on ("_package"))
    (:file "Alert" :depends-on ("_package_Alert"))
    (:file "_package_Alert" :depends-on ("_package"))
    (:file "LiftingTask" :depends-on ("_package_LiftingTask"))
    (:file "_package_LiftingTask" :depends-on ("_package"))
    (:file "LiftDriveCameraTask" :depends-on ("_package_LiftDriveCameraTask"))
    (:file "_package_LiftDriveCameraTask" :depends-on ("_package"))
    (:file "DrivingTask" :depends-on ("_package_DrivingTask"))
    (:file "_package_DrivingTask" :depends-on ("_package"))
    (:file "NutrientPumpTask" :depends-on ("_package_NutrientPumpTask"))
    (:file "_package_NutrientPumpTask" :depends-on ("_package"))
    (:file "WaterTankTask" :depends-on ("_package_WaterTankTask"))
    (:file "_package_WaterTankTask" :depends-on ("_package"))
    (:file "PressureTask" :depends-on ("_package_PressureTask"))
    (:file "_package_PressureTask" :depends-on ("_package"))
  ))