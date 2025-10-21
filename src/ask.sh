#!/usr/bin/env bash
model="${ASK_MODEL:-ask}"

# Set ollama options based on DEBUG environment variable
if [ -n "$DEBUG" ]; then
  # Debug mode: verbose output, no hidden thinking
  ollama_opts="--verbose"
else
  # Normal mode: hide thinking process
  ollama_opts="--hidethinking"
fi

if [ -t 0 ] && [ -n "$1" ]; then
  # prompt passed as an argument
  ollama run "$model" $ollama_opts "$*"
else
  # prompt from stdin (pipe or here-doc)
  ollama run "$model" $ollama_opts
fi
