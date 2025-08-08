#!/bin/bash

# 🧠 Claude Brain System - Quick Installer
# Version: 2.0
# One-command installation into any project

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'
BOLD='\033[1m'

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INSTALL_SOURCE="$SCRIPT_DIR/.claude"

# Default target
TARGET_DIR="${1:-.}"
INSTALL_DIR="$TARGET_DIR/.claude"

# Banner
echo -e "${CYAN}"
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║     🧠 ${BOLD}CLAUDE BRAIN INSTALLER${NC}${CYAN} - SUPERCHARGED EDITION        ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo -e "${NC}\n"

# Check target directory
if [ ! -d "$TARGET_DIR" ]; then
    echo -e "${RED}❌ Target directory does not exist: $TARGET_DIR${NC}"
    exit 1
fi

# Check if already installed
if [ -d "$INSTALL_DIR/brain" ]; then
    echo -e "${YELLOW}⚠️  Brain system already installed in $TARGET_DIR${NC}"
    read -p "Reinstall? Existing data will be backed up (y/n): " CONFIRM
    if [[ "$CONFIRM" =~ ^[Yy]$ ]]; then
        BACKUP_DIR="${INSTALL_DIR}.backup.$(date +%Y%m%d_%H%M%S)"
        mv "$INSTALL_DIR" "$BACKUP_DIR"
        echo -e "${GREEN}✅ Backed up to $BACKUP_DIR${NC}"
    else
        exit 0
    fi
fi

echo -e "${BLUE}▶${NC} Installing Claude Brain System..."

# Copy brain structure
echo "  → Creating directory structure..."
cp -r "$INSTALL_SOURCE" "$TARGET_DIR/"

# Initialize state files
echo "  → Initializing state management..."
cat > "$INSTALL_DIR/brain/context/state/current-state.json" << 'EOF'
{
  "session": {
    "id": "init-session",
    "start_time": "DATE_PLACEHOLDER",
    "last_update": "DATE_PLACEHOLDER",
    "focus": "Initial setup",
    "critical_context": []
  },
  "todos": {
    "in_progress": [],
    "pending": [],
    "completed": []
  },
  "activity": {
    "last_prompt": null,
    "prompt_count": 0,
    "last_tool": null,
    "tool_count": 0,
    "files_touched": [],
    "current_task": "Setup complete"
  },
  "today": {
    "files_modified": [],
    "tasks_completed": [],
    "blockers": []
  },
  "git": {
    "branch": "main",
    "uncommitted_count": 0
  },
  "snapshots": {
    "last_checkpoint": null,
    "checkpoint_count": 0,
    "last_snapshot_time": "DATE_PLACEHOLDER"
  },
  "prompt_history": []
}
EOF

# Replace date placeholders
CURRENT_DATE=$(date -u +%Y-%m-%dT%H:%M:%SZ)
if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' "s/DATE_PLACEHOLDER/$CURRENT_DATE/g" "$INSTALL_DIR/brain/context/state/current-state.json"
else
    sed -i "s/DATE_PLACEHOLDER/$CURRENT_DATE/g" "$INSTALL_DIR/brain/context/state/current-state.json"
fi

# Create ACTIVE_SESSION.md
cat > "$INSTALL_DIR/brain/context/ACTIVE_SESSION.md" << EOF
# ACTIVE SESSION STATE - LIVE CONTEXT
**Last Update**: $(date +"%Y-%m-%d %H:%M:%S")
**Brain Version**: 2.0

## SESSION METRICS
- **Duration**: 0 minutes
- **Prompts**: 0
- **Tool Uses**: 0
- **Checkpoints**: 0

## CURRENT FOCUS
Brain system initialized

## RECOVERY INSTRUCTIONS
If context lost, run: \`/restore\`
EOF

# Create active-todos.json
echo '{"todos":{"in_progress":[],"pending":[],"completed":[]},"last_update":"'$CURRENT_DATE'"}' \
    | jq '.' > "$INSTALL_DIR/brain/context/active-todos.json"

# Create CLAUDE.md if not exists
if [ ! -f "$TARGET_DIR/CLAUDE.md" ]; then
    echo "  → Creating CLAUDE.md..."
    cat > "$TARGET_DIR/CLAUDE.md" << 'EOF'
# CLAUDE.md

This file provides guidance to Claude Code when working with this repository.

## 🧠 Claude Brain System Active

Your brain system is installed and provides:
- **Automatic checkpointing** on every prompt
- **Todo synchronization** between UI and files
- **State preservation** across sessions
- **Context recovery** with `/restore`

## Essential Commands

- `/checkpoint` - Manual checkpoint
- `/restore` - Recover context
- `/code-review` - Review changes
- `/bug-fix` - Debug issues

## 🚨 CRITICAL: Todo Management
**ALWAYS write todos to `.claude/brain/context/active-todos.json` BEFORE using TodoWrite**

This ensures automatic checkpoint creation and state synchronization.

## Quick Recovery

If context is lost:
1. Run `/restore`
2. Check `.claude/brain/context/ACTIVE_SESSION.md`
3. Continue from last checkpoint

---
*Brain System v2.0 Installed*
EOF
fi

# Set permissions
echo "  → Setting permissions..."
chmod +x "$INSTALL_DIR"/scripts/**/*.sh 2>/dev/null || true
chmod +x "$INSTALL_DIR"/hooks/**/*.sh 2>/dev/null || true

# Update .gitignore
if [ -f "$TARGET_DIR/.gitignore" ]; then
    if ! grep -q "# Claude Brain System" "$TARGET_DIR/.gitignore"; then
        echo "  → Updating .gitignore..."
        cat >> "$TARGET_DIR/.gitignore" << 'EOF'

# Claude Brain System
.claude/brain/context/checkpoints/*
.claude/brain/context/state/current-state.json
.claude/brain/context/state/*.backup.json
.claude/brain/context/ACTIVE_SESSION.md
.claude/brain/context/active-todos.json
.claude/logs/*
.claude/settings.local.json
EOF
    fi
fi

# Create initial checkpoint
echo "  → Creating initial checkpoint..."
CHECKPOINT_DIR="$INSTALL_DIR/brain/context/checkpoints"
TIMESTAMP=$(date +%y%m%d_%H%M%S)
cat > "$CHECKPOINT_DIR/${TIMESTAMP}_init.md" << EOF
# Initial Checkpoint - Brain System Installed

**Date**: $(date)
**Version**: 2.0
**Project**: $TARGET_DIR

## Installation Summary
- Brain system successfully installed
- State management initialized
- Hooks configured
- Ready for use

## Next Steps
1. Read CLAUDE.md for project guidelines
2. Use /checkpoint to save state
3. Use /restore to recover context
EOF

echo -e "\n${GREEN}╔══════════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║           🎉 ${BOLD}INSTALLATION SUCCESSFUL!${NC} ${GREEN}🎉                    ║${NC}"
echo -e "${GREEN}╚══════════════════════════════════════════════════════════════╝${NC}\n"

echo -e "${CYAN}📊 Installation Summary:${NC}"
echo "  • Location: $INSTALL_DIR"
echo "  • Status: ${GREEN}ACTIVE${NC}"
echo "  • Version: 2.0"

echo -e "\n${YELLOW}🚀 Quick Start:${NC}"
echo "  1. Read ${BOLD}CLAUDE.md${NC} in your project root"
echo "  2. Your brain system is now active!"
echo "  3. Every prompt creates an automatic checkpoint"

echo -e "\n${GREEN}Claude Code is now SUPERCHARGED! 🧠⚡${NC}\n"