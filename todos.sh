#!/bin/bash
clear
grep -R @todo . --exclude-dir=snippets --color
