import math

# home position in encoder ticks for the servo.

servo_param = {

    1: {                        # Shoulder 1
        'home_encoder': -1550,
        'max_ang': math.radians(220.),
        'min_ang': math.radians(90.),
        'max_encoder' : 4095,
        'max_speed' : math.radians(50),
        'rad_per_enc' : math.radians(251.)/4095.
       },
    2: {                        # Shoulder 2
        'home_encoder': -200,
        'max_ang': math.radians(220.),
        'min_ang': math.radians(90.),
        'max_encoder' : 4095,
        'max_speed' : math.radians(50),
        'rad_per_enc' : math.radians(251.)/4095.
       },
    3: {                        # elbow1
        'home_encoder': 170,
        'max_ang': math.radians(300.),
        'min_ang': math.radians(45.),
        'max_encoder' : 4095,
        'max_speed' : math.radians(50),
        'rad_per_enc' : math.radians(360.)/4095.
       },
    4: {                        # elbow2
        'home_encoder': -550,
        'max_ang': math.radians(280.),
        'min_ang': math.radians(75.),
        'max_encoder' : 4095,
        'max_speed' : math.radians(50),
        'rad_per_enc' : math.radians(360.)/4095.
       },
    5: {                        # Wrist
        'home_encoder': 1340,
        'max_ang': math.radians(360.),
        'min_ang': math.radians(-360.),
        'max_encoder' : 4095,
        'max_speed' : math.radians(50),
        'rad_per_enc' : math.radians(360.)/4095.
       },
    6: {                        # End Effector
        #'home_encoder': -4095,
        'max_ang': math.radians(360.),
        'min_ang': math.radians(-360.),
        #'max_encoder' : 4095,
        'rad_per_enc' : math.radians(360.)/4095.
       }

}

