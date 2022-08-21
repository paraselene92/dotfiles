function move_temp_dir
    set -x today (date -I)
    if not test -d /tmp/$today
        mkdir /tmp/$today
    end
    cd /tmp/$today
end

