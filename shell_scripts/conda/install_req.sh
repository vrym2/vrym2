#!/bin/bash

while IFS= read -r line
do
    mamba install "${line}"
done < "$1"