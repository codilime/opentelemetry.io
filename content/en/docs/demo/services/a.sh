#!/bin/bash

# Iterate over each markdown file in the current directory
for file in *.md; do
    # Extract filename without extension
    filename="${file%.*}"
    
    # Create a directory with the same name as the markdown file
    mkdir -p "$filename/docs"
    
    # Copy a template YAML file to the new directory
    sed "s/REPLACE/$filename/g" mkdocs.yaml > "$filename/mkdocs.yaml"
    
    # Move the markdown file into the nested docs directory
    mv "$file" "$filename/docs/index.md"
done