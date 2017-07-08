join() {
    IFS="$1"
    shift
    echo "$*"
}

get_existing_yml_for_all_groups() {
    filename=$1;
    all_groups_not_checked="$(cat $filename | grep -Eo '^\[.*\]$' | sed 's/\[//g' | sed 's/\]//g')";
    result=$(echo "$all_groups_not_checked" |\
        while read line;
        do
            if [ -f "$line.yml" ] ; then
                echo $line.yml;
            fi;
        done;)
    echo -n $result
}

define_groups() {
    arg=$1
    shift
    other_params=$@
    arg_groups=$(echo $arg| sed 's/,/\n/g')"";
    found_groups=$(echo "$arg_groups" | while read search_group; do
        group=$(echo "$other_params" | grep -o "$search_group.yml");
        if [ "$group" ] ; then
            echo $group;
        fi;
    done;)
    if [ -n "$found_groups" ] ; then
        echo -n $found_groups;
    fi;
}

get_tags_and_groups() {
    filename=$1
    shift;
    first_arg="";
    first_arg=$1;
    groups="";
    all_groups=$( get_existing_yml_for_all_groups $filename )
    if [ -z "$first_arg" ] ; then
        echo "Working by default with all hosts";
        groups=$all_groups;
    else
        #echo "$first_arg $all_groups"
        search_groups=$(define_groups $first_arg $all_groups)
        if [ "$search_groups" ] ; then
            groups=$search_groups;
            shift;
        else
            groups=$all_groups;
        fi;
    fi;
    if [[ $# -gt 0 ]]; then
        tags="--tags=$(join , $@)"
        echo "tags: $(join , $@)"
    fi
}
