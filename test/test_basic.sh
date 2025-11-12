#!/bin/bash

# Basic functionality tests for System Insight

echo "Running System Insight basic tests..."

# Test 1: Help command
echo "Test 1: Help command"
./sysinsight.sh --help || exit 1

# Test 2: Basic scan
echo "Test 2: Basic scan"
./sysinsight.sh -d /tmp -n 3 || exit 1

# Test 3: Version check
echo "Test 3: Version check"
./sysinsight.sh --version || exit 1

# Test 4: Invalid directory
echo "Test 4: Invalid directory handling"
./sysinsight.sh -d /nonexistent_directory -n 2

echo "All basic tests passed!"