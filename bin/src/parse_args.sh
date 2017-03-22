join() {
    IFS="$1"
    shift
    echo "$*"
}

first_arg="";
first_arg=$1;
groups="";
all_groups_not_checked="$(cat ./hosts.ini | grep -Eo '^\[.*\]$' | sed 's/\[\|\]//g')";
all_groups=$(echo "$all_groups_not_checked" | while read line; do if [ -f "$line.yml" ] ; then echo $line.yml; fi; done)
if [ -z "$first_arg" ] ; then
    echo "Working by default for all hosts";
    export groups=$all_groups;
    echo $groups;
else
    arg_groups=$(echo $first_arg| sed 's/,/\n/g')"";
    found_groups=$(echo "$arg_groups" | while read search_group; do
        group=$(echo "$all_groups" | grep -E "^$search_group$" )
        if [ "$group" ] ; then
            echo $group;
        fi;
    done)
    if [ -n "$found_groups" ] ; then
        echo "working with "$(join $found_groups)" group";
    else
        export groups=$all_groups;
    fi;
    shift;
fi;
if [[ $# -gt 1 ]]; then
    tags="--tags=$(join , $@)"
fi

groups="$(join ' ' $groups)"
