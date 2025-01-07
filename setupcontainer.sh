#!/bin/bash

project_dir="$1"
shift

if [ "$project_dir" == "" ]; then
    echo "USAGE: $0 /ABSOLUTE/PATH/TO/PROJECT [PROJECT_NAME]"
    exit 1
fi

$project_name="$1"

if [ "$project_name" == "" ]; then
    project_name=$(basename $project_dir)
fi


if docker run -it --name $project_name -v $project_dir:/var/www/ -p 80:80 wprunner ; then

    echo 
    echo "   ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
    echo "   ┃  DONE!                              ┃"
    echo "   ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
    echo
    echo "Now you can use:"
    echo "  docker start $project_name"
    echo "  docker exec -it $project_name bash"
    echo "  docker exec -it $project_name mysql wordpress"
    echo "  docker exec -i $project_name mysql wordpress < /path/to/your/sqlfile.sql"
    echo "  docker stop $project_name"

fi
