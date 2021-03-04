function move_temp_dir
    set -x today (date | awk -F" " '{ print $6,$2,$3 }' | tr " " "-")
    if not test -d /tmp/$today
        mkdir /tmp/$today
    end
    cd /tmp/$today
end

