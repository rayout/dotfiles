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
    echo "Working by default with all hosts";
    groups=$all_groups;
else
    arg_groups=$(echo $first_arg| sed 's/,/\n/g')"";
    found_groups=$(echo "$arg_groups" | while read search_group; do
        group=$(echo "$all_groups" | grep -E "^$search_group.yml$" )
        if [ "$group" ] ; then
            echo $group;
        fi;
    done)
    if [ -n "$found_groups" ] ; then
        groups=$found_groups;
        found_groups=$(echo $found_groups|sed 's/\.yml//g')
        echo "Working with "$(join , $found_groups)" group";
        shift;
    else
        echo "Working by default with all hosts";
        groups=$all_groups;
    fi;
fi;

if [[ $# -gt 0 ]]; then
    tags="--tags=$(join , $@)"
fi
