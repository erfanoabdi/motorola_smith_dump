#!/vendor/bin/sh

scriptname=${0##*/}
thermal_zone_type="front-step"

notice()
{
    echo "$*"
    echo "$scriptname: $*" > /dev/kmsg
}

for d in /sys/class/thermal/*; do
    if [[ "$(cat $d/type)" == "$thermal_zone_type" ]]; then
        echo "disabled" >> "$d/mode";
        notice "Disabled $thermal_zone_type at $d";
    fi
done
