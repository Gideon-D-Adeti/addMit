#!/bin/bash

# Function to print usage instructions
print_usage() {
    local exit_status=${1:-1}
    
    echo "Usage:"
    echo "  addMit                                           # Stage all changes and open a text editor to enter the commit message"
    echo "  addMit -m \"Your commit message here\"            # Stage all changes and commit with the provided message"
    echo "  addMit <file1> [<file2> ...] -m \"Your commit message here\"  # Stage specific file(s) and commit with the provided message"
    echo "  addMit <file1> [<file2> ...]                      # Stage specific file(s) and open a text editor to enter the commit message"
    
    exit $exit_status
}

# Check if the first argument is '-h' or '--help'
if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    print_usage 0
fi

# Initialize an array to hold file names
files=()
commit_message=""

# Process arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -m)
            shift
            commit_message="$1"
            break
            ;;
        *)
            files+=("$1")
            ;;
    esac
    shift
done

# Case 1: Stage all changes and open a text editor to enter the commit message
if [ ${#files[@]} -eq 0 ] && [ -z "$commit_message" ]; then
    git add .
    git commit
    exit 0
fi

# Case 2: Stage all changes and commit with the provided message
if [ ${#files[@]} -eq 0 ] && [ -n "$commit_message" ]; then
    git add .
    git commit -m "$commit_message"
    exit 0
fi

# Case 3: Stage specific file(s) and open a text editor to enter the commit message
if [ ${#files[@]} -gt 0 ] && [ -z "$commit_message" ]; then
    git add "${files[@]}"
    git commit
    exit 0
fi

# Case 4: Stage specific file(s) and commit with the provided message
if [ ${#files[@]} -gt 0 ] && [ -n "$commit_message" ]; then
    git add "${files[@]}"
    git commit -m "$commit_message"
    exit 0
fi

# If none of the above cases match, print usage
print_usage