#!/bin/bash

docker build -t wprunner .
echo 
echo "   ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
echo "   ┃  DONE!                              ┃"
echo "   ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
echo
echo "Now you can setup projects with:"
echo "  ./setupcontainer.sh [/ABSOLUTE/PATH/TO/PROJECT]"
echo
