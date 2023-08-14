#!/bin/bash

source configuration/.env.shared

fvm install "$FLUTTER_VERSION"
fvm use "$FLUTTER_VERSION" --force