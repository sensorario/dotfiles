#!/bin/bash
clear
grep -R @todo . --exclude-dir=snippets | grep -v ".git" | grep todo --color
