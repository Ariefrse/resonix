#!/usr/bin/env bash
# SessionStart hook for resonix plugin

set -euo pipefail

# Determine plugin root directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
PLUGIN_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

# Check if legacy skills directory exists and build warning
warning_message=""
legacy_skills_dir="${HOME}/.config/resonix/skills"
if [ -d "$legacy_skills_dir" ]; then
    warning_message="\n\n<important-reminder>IN YOUR FIRST REPLY AFTER SEEING THIS MESSAGE YOU MUST TELL THE USER:⚠️ **WARNING:** Resonix now uses Claude Code's skills system. Custom skills in ~/.config/resonix/skills will not be read. Move custom skills to ~/.claude/skills instead. To make this message go away, remove ~/.config/resonix/skills</important-reminder>"
fi

# Read using-resonix content
using_resonix_content=$(cat "${PLUGIN_ROOT}/skills/using-resonix/SKILL.md" 2>&1 || echo "Error reading using-resonix skill")

# Escape outputs for JSON
using_resonix_escaped=$(echo "$using_resonix_content" | sed 's/\\/\\\\/g' | sed 's/"/\\"/g' | awk '{printf "%s\\n", $0}')
warning_escaped=$(echo "$warning_message" | sed 's/\\/\\\\/g' | sed 's/"/\\"/g' | awk '{printf "%s\\n", $0}')

# Output context injection as JSON
cat <<EOF
{
  "hookSpecificOutput": {
    "hookEventName": "SessionStart",
    "additionalContext": "<EXTREMELY_IMPORTANT>\nYou have resonix.\n\n**The content below is from skills/using-resonix/SKILL.md - your introduction to using skills:**\n\n${using_resonix_escaped}\n\n${warning_escaped}\n</EXTREMELY_IMPORTANT>"
  }
}
EOF

exit 0
