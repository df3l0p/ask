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

# Prepare system information context
system_info="System: $(uname -s) $(uname -m) | Kernel: $(uname -r) | Shell: $SHELL"

# Check if at least one argument is provided
if [ $# -eq 0 ]; then
  echo "Usage: ask <question>"
  echo "Example: ask 'list files in current directory'"
  exit 1
fi

# prompt passed as an argument
{
  echo "SYSTEM: $system_info"
  echo "USER: $*"
} | ollama run "$model" $ollama_opts
