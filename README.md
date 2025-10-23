# Ask

A simple CLI tool that uses Ollama and local LLMs to generate shell commands in tldr format.

## Features

- 🤖 Uses local LLM (Qwen3:8b) for privacy
- 📝 Generates commands in tldr format with brief descriptions
- 🔧 Simple command line argument interface
- 🐛 Debug mode for troubleshooting
- ⚡ Fast command generation with safe defaults
- 🖥️ Automatically provides system information context for better command adaptation

## Prerequisites

- [Ollama](https://ollama.com/) installed and running
- Bash shell (POSIX compatible)

## Installation

1. Clone this repository:
   ```bash
   git clone <repository-url>
   cd ask
   ```

2. Build the custom model:
   ```bash
   make build-model
   ```

3. Install the CLI tool:
   ```bash
   make install
   ```

## Usage

### Basic Usage

Generate a command by asking a question:
```bash
ask "list files in current directory"
# Output: List files with details:
#         ls -la
```

For multi-line questions, use quotes:
```bash
ask "create tar archive with password protection"
# Output: Create password-protected tar archive:
#         tar -czf archive.tar.gz --password files/
```

## Configuration

### Environment Variables

- `ASK_MODEL`: Override the default model name (default: `ask`)
- `DEBUG`: Enable verbose output and disable hidden thinking

Example:
```bash
export ASK_MODEL="my-custom-model"
export DEBUG=1
ask "show disk usage"
```

### Model Parameters

The model is configured with these parameters:
- Temperature: 0.15 (balanced creativity/consistency)
- Context window: 2048 tokens
- Max prediction: 1024 tokens

### System Information Context

The tool automatically provides system information to the AI model before processing your request. This includes:
- Operating system name and architecture
- Kernel version
- Current shell

This context helps the AI generate more appropriate commands for your specific system. For example, it will suggest `brew` commands on macOS, `apt` commands on Debian/Ubuntu, etc.

## Examples

```bash
# File operations
ask "find all .txt files"
ask "compress directory to zip"

# System information
ask "show running processes"
ask "check disk space"

# Network operations
ask "download file from url"
ask "check if port is open"

# Git operations
ask "create new branch"
ask "undo last commit"
```
