---
layout: default
title: Vibe-Tools Framework
parent: Core Frameworks
nav_order: 3
---
<div align="center">
  <img height="72" src="https://github.com/user-attachments/assets/45eff178-242f-4d84-863e-247b080cc6f5" />
</div>

<div align=center><h1>Give Cursor Agent an AI team and advanced skills</h1></div>

# Vibe-Tools Framework

A CLI utility for enhancing AI-assisted development across various tasks and contexts.

## Key Commands

| Command | Purpose | Example |
|---------|---------|---------|
| `vibe-tools ask` | Query AI models directly | `vibe-tools ask "How do I optimize this React component?"` |
| `vibe-tools web` | Web-aware AI assistance | `vibe-tools web "Security practices for Express apps"` |
| `vibe-tools repo` | Context-aware repo analysis | `vibe-tools repo "Explain our authentication flow"` |
| `vibe-tools plan` | Implementation planning | `vibe-tools plan "Add user profile feature"` |
| `vibe-tools doc` | Documentation generation | `vibe-tools doc --save-to=api-docs.md` |

## Installation

```bash
# Install globally
npm install -g vibe-tools

# Verify installation
vibe-tools --version
```

## Configuration

Create a `vibe-tools.config.json` file in your project root:

```json
{
  "defaultModel": "claude-3-opus-20240229",
  "apiKey": "<your-api-key>",
  "outputFormat": "markdown"
}
```

## Integration with Other Frameworks

Vibe-tools works seamlessly with both the BMAD Method and CursorRIPER:

- Use `vibe-tools ask` with BMAD personas
- Structure `vibe-tools plan` commands using CursorRIPER modes

## Resources

For more information about vibe-tools, check out the [official repository](https://github.com/eastlondoner/cursor-tools).

## Node Package Manager (npm)

vibe-tools is available on npm [here](https://www.npmjs.com/package/vibe-tools)