#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Author: [Your Name] | Software: Firefox
# Generates a personalised open source philosophy statement
# Demonstrates: read, string concatenation, file redirection, date, aliases (conceptual)

# --- Conceptual alias note ---
# In a real interactive shell, one might define:
# alias today='date "+%d %B %Y"'
# We replicate that concept here with a variable:
TODAY=$(date '+%d %B %Y')
OUTPUT="manifesto_$(whoami)_$(date +%Y%m%d).txt"

echo "================================================"
echo " Open Source Manifesto Generator"
echo " Powered by: Mozilla Firefox philosophy"
echo "================================================"
echo ""
echo "Answer three questions to create your manifesto."
echo ""

# --- Interactive input using read ---
read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

echo ""
echo "Generating your manifesto..."
echo ""

# --- Write manifesto to file using > redirection ---
{
  echo "My Open Source Manifesto"
  echo "Written on $TODAY"
  echo ""
  echo "Every day, I use $TOOL -- a tool built not by a corporation for profit,"
  echo "but by people who believed that the best work happens when it is shared freely."
  echo "To me, freedom means $FREEDOM. That word is at the heart of why open source matters."
  echo "It is not just about software being free to download -- it is about the freedom"
  echo "to inspect, to change, to understand, and to improve."
  echo ""
  echo "I am inspired by Mozilla Firefox, a browser built by a non-profit organisation"
  echo "to keep the web open for everyone. Not owned by one company. Not optimised for"
  echo "one company's profit. Built for the human beings who use it."
  echo ""
  echo "One day, I will build $BUILD and release it freely."
  echo "Not because I have to. Because I believe that knowledge shared is knowledge multiplied."
  echo "This is my commitment to the open source philosophy."
  echo ""
  echo "Signed: $(whoami) | $TODAY"
} > "$OUTPUT"

echo "================================================"
echo " Manifesto saved to: $OUTPUT"
echo "================================================"
echo ""
cat "$OUTPUT"
echo ""
echo "================================================"
echo " Share your manifesto. That is the open source way."
echo "================================================"
