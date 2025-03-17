#!/bin/bash

alls=$(docker exec ollama ollama list)
echo "$alls"
names=$(echo "$alls" | awk 'NR>1 {print $1}')
echo "$names"
for name in $names;do
        docker exec ollama ollama pull "$name"
        echo "$name has been update"
done