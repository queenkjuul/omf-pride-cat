function pride_flag
    echo $argv[1]
    echo $argv[2]
    function writeline
        while $i < $argv
            echo -n " "
            set i (math $i+1)
        end
        echo -e "\n"
    end
    switch $argv[1]
        case gay
            set_color -b FF0018; writeline $argv[1]
            set_color -b FFA52C; echo -n "        "
            set_color -b FFFF41; echo -n "        "
    end
end