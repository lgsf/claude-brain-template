# 🔧 Troubleshooting Guide

## Common Issues and Solutions

### 🔴 Installation Issues

#### Problem: Permission Denied
```bash
./install.sh: Permission denied
```

**Solution:**
```bash
chmod +x install.sh
./install.sh
```

#### Problem: jq not found
```
jq: command not found
```

**Solution:**
```bash
# macOS
brew install jq

# Ubuntu/Debian
sudo apt-get install jq

# CentOS/RHEL
sudo yum install jq
```

---

### 🟡 Checkpoint Issues

#### Problem: Checkpoints not creating automatically
**Symptoms:**
- No files in `.claude/brain/context/checkpoints/`
- Prompts not triggering saves

**Solutions:**
1. Check hook permissions:
```bash
ls -la .claude/hooks/*/trigger.sh
# All should be executable (rwxr-xr-x)
```

2. Fix permissions:
```bash
chmod +x .claude/hooks/*/trigger.sh
```

3. Test hook manually:
```bash
echo '{"prompt":"test"}' | .claude/hooks/user-prompt-submit/trigger.sh
```

#### Problem: Too many checkpoint files
**Symptoms:**
- Hundreds of files in checkpoints directory
- Slow performance

**Solution:**
```bash
# View checkpoint statistics
.claude/scripts/utilities/manage-checkpoints.sh stats

# Clean old checkpoints (keep last 30 days)
.claude/scripts/utilities/manage-checkpoints.sh clean 30
```

---

### 🟠 Todo Synchronization

#### Problem: Todos not syncing
**Symptoms:**
- TodoWrite updates don't appear in state
- active-todos.json not updating

**Solutions:**
1. Always update bridge file first:
```bash
# Update this file BEFORE using TodoWrite
.claude/brain/context/active-todos.json
```

2. Check state manager:
```bash
# Test state manager
.claude/scripts/core/state-manager.sh --mode=track --trigger=todo
```

3. Verify JSON format:
```bash
jq '.' .claude/brain/context/active-todos.json
```

---

### 🔵 State Management

#### Problem: State file corrupted
```
parse error: Invalid JSON
```

**Solution:**
1. Check for backup:
```bash
ls .claude/brain/context/state/*.backup.json
```

2. Restore from backup:
```bash
cp .claude/brain/context/state/current-state.backup.json \
   .claude/brain/context/state/current-state.json
```

3. Reinitialize if needed:
```bash
cat > .claude/brain/context/state/current-state.json << 'EOF'
{
  "session": {},
  "todos": {"in_progress":[],"pending":[],"completed":[]},
  "activity": {},
  "snapshots": {}
}
EOF
```

#### Problem: State not updating
**Symptoms:**
- Changes not reflected in current-state.json
- ACTIVE_SESSION.md outdated

**Solution:**
```bash
# Force state update
.claude/scripts/core/state-manager.sh --mode=snapshot --trigger=manual
```

---

### 🟣 Recovery Issues

#### Problem: /restore command not working
**Symptoms:**
- Context not recovering
- Error messages when running restore

**Solutions:**
1. Check latest checkpoint:
```bash
ls -lt .claude/brain/context/checkpoints/ | head -5
```

2. Manually restore:
```bash
# Read latest checkpoint
cat .claude/brain/context/checkpoints/[latest_file].md
```

3. Restore specific checkpoint:
```bash
.claude/scripts/session/restore.sh [checkpoint_file]
```

---

### ⚫ Hook Problems

#### Problem: Hooks not triggering
**Symptoms:**
- No automatic checkpoints
- State not updating on actions

**Debug Steps:**
1. Enable debug logging:
```bash
export CLAUDE_DEBUG=true
```

2. Check hook logs:
```bash
tail -f /tmp/hook-debug.log
tail -f /tmp/prompt-debug.log
```

3. Test hooks directly:
```bash
# Test user prompt hook
echo '{"prompt":"test message"}' | \
  .claude/hooks/user-prompt-submit/trigger.sh

# Test tool use hook
echo '{"tool_name":"Write","tool_input":{"file_path":"test.txt"}}' | \
  .claude/hooks/post-tool-use/trigger.sh
```

---

### 🔶 Performance Issues

#### Problem: System running slowly
**Symptoms:**
- Delays in checkpoint creation
- Slow todo updates

**Solutions:**
1. Clean up old files:
```bash
# Remove old checkpoints
find .claude/brain/context/checkpoints -mtime +30 -delete

# Clear logs
> .claude/logs/activity.log
```

2. Optimize state file:
```bash
# Compact state file
jq -c '.' .claude/brain/context/state/current-state.json > temp.json
mv temp.json .claude/brain/context/state/current-state.json
```

3. Check file sizes:
```bash
du -sh .claude/*
du -sh .claude/brain/context/checkpoints/
```

---

### 🟢 Quick Fixes

#### Reset Everything
```bash
# Complete reset (preserves checkpoints)
rm -f .claude/brain/context/state/current-state.json
rm -f .claude/brain/context/ACTIVE_SESSION.md
rm -f .claude/brain/context/active-todos.json

# Reinitialize
./install.sh .
```

#### Test Installation
```bash
# Run all tests
.claude/scripts/utilities/test-all.sh

# Individual tests
.claude/scripts/utilities/test-hooks.sh
.claude/scripts/utilities/test-state.sh
.claude/scripts/utilities/test-checkpoints.sh
```

#### Emergency Recovery
```bash
# If everything fails, recover from git
git stash
git checkout .claude/
git stash pop
```

---

## 📊 Diagnostic Commands

### System Health Check
```bash
#!/bin/bash
# Save as: .claude/scripts/utilities/health-check.sh

echo "🧠 Claude Brain System Health Check"
echo "===================================="

# Check directories
echo -n "Directories: "
if [ -d ".claude/brain" ]; then
    echo "✅"
else
    echo "❌ Missing directories"
fi

# Check scripts
echo -n "Scripts: "
if [ -x ".claude/scripts/core/state-manager.sh" ]; then
    echo "✅"
else
    echo "❌ Scripts not executable"
fi

# Check hooks
echo -n "Hooks: "
if [ -x ".claude/hooks/user-prompt-submit/trigger.sh" ]; then
    echo "✅"
else
    echo "❌ Hooks not configured"
fi

# Check state
echo -n "State: "
if jq '.' .claude/brain/context/state/current-state.json >/dev/null 2>&1; then
    echo "✅"
else
    echo "❌ State file invalid"
fi

# Check checkpoints
echo -n "Checkpoints: "
count=$(ls .claude/brain/context/checkpoints/*.md 2>/dev/null | wc -l)
echo "✅ ($count files)"

echo "===================================="
```

---

## 🆘 Getting Help

### Debug Mode
Enable verbose logging:
```bash
# In your shell
export CLAUDE_DEBUG=true
export CLAUDE_LOG_LEVEL=verbose
```

### Log Locations
- Hook logs: `/tmp/hook-debug.log`
- Prompt logs: `/tmp/prompt-debug.log`
- System logs: `.claude/logs/`

### Support Resources
1. Check the [GitHub Issues](https://github.com/yourusername/claude-brain-template/issues)
2. Read the [Documentation](README.md)
3. Review [Customization Guide](CUSTOMIZE.md)

### Reporting Issues
When reporting issues, include:
1. Error messages
2. Output of health check
3. Recent checkpoint files
4. Debug logs

---

## 🔄 Recovery Procedures

### Level 1: Soft Recovery
```bash
/restore
```

### Level 2: Manual Recovery
```bash
cat .claude/brain/context/ACTIVE_SESSION.md
cat .claude/brain/context/state/current-state.json | jq '.todos'
```

### Level 3: Checkpoint Recovery
```bash
# Find latest checkpoint
ls -lt .claude/brain/context/checkpoints/ | head -1

# Restore from checkpoint
cat .claude/brain/context/checkpoints/[latest].md
```

### Level 4: Full Reset
```bash
# Backup current state
cp -r .claude .claude.backup

# Reinstall
./install.sh .
```

---

*Remember: Most issues can be solved by checking permissions and ensuring JSON files are valid.*