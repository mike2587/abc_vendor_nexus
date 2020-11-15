devices=('blueline' 'crosshatch')

function lunch_devices() {
    add_lunch_combo abc_${device}-user
    add_lunch_combo abc_${device}-userdebug
}

for device in ${devices[@]}; do
    lunch_devices
done
