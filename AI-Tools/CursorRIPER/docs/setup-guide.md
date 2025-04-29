![CursorRIPER](../res/github-header.png)
# CursorRIPER Framework - Setup Guide

This guide will help you set up the CursorRIPER Framework for your project.

## Prerequisites

- [Cursor IDE](https://cursor.sh/) installed
- Git (optional but recommended)
- Basic understanding of your project's requirements

## Installation

1. **Copy the framework files to your project and rename the files to *.mdc**

   Create a `.cursor` directory in your project root and copy the necessary files:

   ```bash
      mkdir -p .cursor/rules
      cp -r /path/to/CursorRIPER/src/.cursor/* .cursor/
      cd .cursor/rules/
      rename 's/\.md$/.mdc/' *.md
   ```

2. **Verify the installation**

   Your project should now have the following structure:

   ```
   your-project/
   └── .cursor/
       ├── rules/
       │   ├── core.mdc
       │   ├── state.mdc
       │   ├── start-phase.mdc
       │   ├── riper-workflow.mdc
       │   └── customization.mdc
       └── cursorignore
   ```

## Starting a New Project

1. **Initialize the framework**

   Open your project in Cursor IDE and use the chat feature to initialize the framework:

   ```
   /start
   ```

   or

   ```
   BEGIN START PHASE
   ```

2. **Follow the START phase**

   The framework will guide you through the START phase:

   1. Requirements Gathering
   2. Technology Selection
   3. Architecture Definition
   4. Project Scaffolding
   5. Environment Setup
   6. Memory Bank Initialization

3. **Complete the memory bank setup**

   Ensure all required memory files are created and populated:
   
   - `projectbrief.md`
   - `systemPatterns.md`
   - `techContext.md`
   - `activeContext.md`
   - `progress.md`

## Using the RIPER Workflow

Once you've completed the START phase, you'll automatically transition to the RIPER workflow. Use the following commands to switch between modes:

- `/research` or `ENTER RESEARCH MODE` - Gather information and understand existing code
- `/innovate` or `ENTER INNOVATE MODE` - Brainstorm potential approaches
- `/plan` or `ENTER PLAN MODE` - Create detailed implementation plans
- `/execute` or `ENTER EXECUTE MODE` - Implement the approved plan
- `/review` or `ENTER REVIEW MODE` - Validate the implementation against the plan

## Customization

You can customize the framework behavior by editing `.cursor/rules/customization.mdc`. Some key settings include:

- Response verbosity
- Code style preferences
- Memory update frequency
- Custom command aliases

See the [Customization Guide](customization-guide.md) for more details.

## Troubleshooting

If you encounter issues with the framework:

1. Verify all required files exist in `.cursor/rules/`
2. Check for state inconsistencies
3. Ensure memory bank files exist and are properly formatted
4. Try restarting Cursor IDE

For more help, refer to the [Troubleshooting Guide](troubleshooting-guide.md).

---

*The CursorRIPER Framework prevents coding disasters while maintaining perfect continuity across sessions.*
