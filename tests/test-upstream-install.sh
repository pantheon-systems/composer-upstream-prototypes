#!/bin/bash

TEST_DIR="$1"

TEST_MODULE=pathauto
TEST_MODULE_DIR="$TEST_DIR/web/modules/contrib/$TEST_MODULE"


# Start off by removing all of the untracked files in the test project
git -C "$TEST_DIR" clean -fdX

# Ensure that test module is not installed
if [ -d "$TEST_MODULE_DIR" ] ; then
  echo "Error: $TEST_MODULE must not exist before test runs."
  exit 1
fi

# Ensure that the SUT does not contain a reference to the test module
# in its composer.json file. It must be installed via the upstream.
grep "$TEST_MODULE" "$TEST_DIR/composer.json" >/dev/null 2>&1
if [ $? -eq 0 ] ; then
  echo "Error: $TEST_MODULE must not be declared in the project's composer.json file."
  exit 1
fi

# Run install command
composer --working-dir="$TEST_DIR" -n install

# Ensure that test module is installed
if [ ! -d "$TEST_MODULE_DIR" ] ; then
  echo "Error: $TEST_MODULE was not installed by the upstream project."
  exit 1
fi

echo "SUCCESS! $TEST_MODULE was installed."
