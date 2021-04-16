with open('/sys/class/leds/pca963x:arm0:blue/brightness', 'w') as led_brightness:
   led_brightness.write('32')
with open('/sys/class/leds/pca963x:arm1:blue/brightness', 'w') as led_brightness:
   led_brightness.write('32')
with open('/sys/class/leds/pca963x:arm2:blue/brightness', 'w') as led_brightness:
   led_brightness.write('32')
with open('/sys/class/leds/pca963x:arm3:blue/brightness', 'w') as led_brightness:
   led_brightness.write('32')

