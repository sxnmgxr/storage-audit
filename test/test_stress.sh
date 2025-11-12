#!/bin/bash

# Stress tests for System Insight

echo "Running stress tests..."

# Test with large number of files
echo "Creating test files..."
mkdir -p /tmp/stress_test
for i in {1..1000}; do
    dd if=/dev/zero of=/tmp/stress_test/file$i bs=1k count=1 2>/dev/null
done

echo "Running stress scan..."
./sysinsight.sh -d /tmp/stress_test -n 20

# Cleanup
rm -rf /tmp/stress_test

echo "Stress tests completed!"