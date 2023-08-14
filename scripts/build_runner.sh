#!/bin/bash

# Generate code
echo "👉 generating code"
fvm flutter pub run build_runner build --delete-conflicting-outputs