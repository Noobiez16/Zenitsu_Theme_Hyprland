#!/bin/bash
# ⚡ Zenitsu Notification Test Script ⚡
# Tests all notification types with bottom-up sliding animations

echo "⚡ Testing Zenitsu Notification System..."
echo "---"

# Test 1: Low Priority
echo "1. Sending LOW priority notification..."
notify-send "⚡ Thunder Form One" "Low priority notification (5s timeout)" -u low -t 5000
sleep 3

# Test 2: Normal Priority
echo "2. Sending NORMAL priority notification..."
notify-send "⚡ Thunder Form Two" "Normal priority notification (10s timeout)" -u normal -t 10000
sleep 3

# Test 3: Critical Priority
echo "3. Sending CRITICAL priority notification..."
notify-send "⚡⚡⚡ THUNDER FORM SIX ⚡⚡⚡" "CRITICAL! This notification has intense lightning effects and stays until dismissed!" -u critical -t 0
sleep 3

# Test 4: With Icon
echo "4. Sending notification with icon..."
notify-send "⚡ Zenitsu Alert" "Notification with icon and longer text to test wrapping behavior" -i dialog-information -u normal -t 8000
sleep 2

# Test 5: Multiple Notifications (stacking test)
echo "5. Sending multiple notifications to test stacking..."
notify-send "⚡ First Strike" "Testing multiple notifications" -u normal -t 7000 &
sleep 0.5
notify-send "⚡ Second Strike" "Checking slide-up animation" -u normal -t 7000 &
sleep 0.5
notify-send "⚡ Third Strike" "Verifying position consistency" -u normal -t 7000 &

sleep 3
echo "---"
echo "✓ All test notifications sent!"
echo "Check bottom-center of screen for slide-up animations"
echo ""
echo "To open Control Center: swaync-client -t"
