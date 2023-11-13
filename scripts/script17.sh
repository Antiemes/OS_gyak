#!/bin/bash

find . -name "*.sh" -exec sh -c "if grep -q else \"{}\" ; then echo \"{}\" ; fi" \;


