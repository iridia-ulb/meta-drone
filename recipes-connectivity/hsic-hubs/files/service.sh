set_pin_output_state() {
   echo ${1} > /sys/class/gpio/export
   echo "out" > /sys/class/gpio/gpio${1}/direction
   echo ${2} > /sys/class/gpio/gpio${1}/value
   echo ${1} > /sys/class/gpio/unexport
}

disable_hub() {
   # assert reset
   set_pin_output_state $(($1 + $3)) 0
}

enable_hub() {
   # assert reset
   set_pin_output_state $(($1 + $3)) 0
   # assert connect and int (select primary clock)
   set_pin_output_state $(($1 + $2)) 1
   set_pin_output_state $(($1 + $4)) 1
   # sleep for 100ms while that reset sinks in
   sleep 0.5
   # deassert reset
   set_pin_output_state $(($1 + $3)) 1
}

stop_service() {
   echo "Disabling hubs"
   # set gpios back to inputs and unexport
   disable_hub ${gpiobase} `seq 0 2`
   disable_hub ${gpiobase} `seq 4 6`
   kill -TERM $(jobs -p)
   exit 0
}

# get the GPIO base number of the I2C GPIO expander
gpiobase=`grep -lr "of:Ngpi0TCnxp,pca9554" /sys/class/gpio/*/device/modalias | grep -o [0-9]*`
while true; do
   # check if the hubs are connected
   readarray -t hub_product_match <<< $(grep -l 3503 /sys/bus/usb/devices/*/idProduct)
   for index in ${!hub_product_match[@]}
   do
      [ -n "${hub_product_match[$index]}" ] || continue
      hub_product_match[$index]=$(basename $(dirname ${hub_product_match[$index]}))
   done
   # assume both hubs are connected
   connected=true
   if [[ ! "${hub_product_match[@]}" =~ "1-6" ]]; then
      echo "Enabling hub 1-6"
      enable_hub ${gpiobase} `seq 0 2`
      connected=false
   fi
   if [[ ! "${hub_product_match[@]}" =~ "1-7" ]]; then
      echo "Enabling hub 1-7"
      enable_hub ${gpiobase} `seq 4 6`
      connected=false
   fi
   if [[ "${connected}" = true ]]; then
      echo "Both hubs are connected"
      break
   else
      sleep 5
   fi
done
trap stop_service SIGINT SIGTERM
sleep infinity &
wait
