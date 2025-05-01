---
layout: default
title: Project Templates
parent: Examples
nav_order: 2
permalink: /docs/examples/project-templates
---

# Project Templates

{: .fs-9 }
Ready-to-use project templates for common development scenarios
{: .fs-6 .fw-300 }

[Web App](#web-app-template){: .btn .btn-primary .fs-5 .mb-4 .mb-md-0 .mr-2 }
[API Service](#api-service-template){: .btn .fs-5 .mb-4 .mb-md-0 .mr-2 }
[Mobile App](#mobile-app-template){: .btn .fs-5 .mb-4 .mb-md-0 }

---

## Why Use Templates?

Project templates provide consistent, well-organized starting points for your development projects. Benefits include:

- **Faster Setup**: Start coding features immediately instead of building infrastructure
- **Best Practices**: Templates follow established patterns and coding standards
- **Consistency**: Maintain the same structure across multiple projects
- **AI-Friendly**: Well-structured templates are easier for AI to understand and extend

## Web App Template

This template provides a foundation for creating modern web applications with React.

### Features

- React 18 with TypeScript
- Tailwind CSS for styling
- Vite for fast development and builds
- Authentication scaffolding
- Responsive layout components
- Unit testing setup with Vitest

### Usage

```bash
# Clone the template
curl -O https://raw.githubusercontent.com/jvalenzano/vibe-coding-cookbook/main/scripts/init-project.sh
chmod +x init-project.sh

# Create project using the webapp template
./init-project.sh my-project webapp
```

## API Service Template

A robust template for building backend API services with Node.js.

### Features

- Express.js framework
- TypeScript support
- Prisma ORM for database access
- JWT authentication
- Request validation
- API documentation with Swagger
- Testing with Jest

### Usage

```bash
# Clone the template
curl -O https://raw.githubusercontent.com/jvalenzano/vibe-coding-cookbook/main/scripts/init-project.sh
chmod +x init-project.sh

# Create project using the api template
./init-project.sh my-api-service node-api
```

## Mobile App Template

Start building cross-platform mobile applications with React Native.

### Features

- React Native with TypeScript
- Navigation setup
- State management
- Native UI components
- Camera and location access
- Push notifications scaffold
- Testing with React Native Testing Library

### Usage

```bash
# Clone the template
curl -O https://raw.githubusercontent.com/jvalenzano/vibe-coding-cookbook/main/scripts/init-project.sh
chmod +x init-project.sh

# Create project using the mobile template
./init-project.sh my-mobile-app react-native
```

## Customizing Templates

All templates are designed to be easily customizable. Here's how to modify them for your specific needs:

1. **Review the README.md** file in each template for specific customization instructions
2. **Update configuration files** like package.json with your project details
3. **Modify the branding** elements in the UI components
4. **Add or remove features** based on your project requirements

## Vibe Coding with Templates

Templates work especially well with AI-assisted development. Here's a recommended workflow:

1. **Initialize** your project with the appropriate template
2. **Orient your AI** by explaining the template structure
3. **Implement features** collaboratively with your AI assistant
4. **Test and refine** with AI-assisted debugging

## Contributing Templates

Want to share your own templates with the community? Here's how:

1. Fork the [Vibe Coding Cookbook repository](https://github.com/jvalenzano/vibe-coding-cookbook)
2. Add your template to the `templates/projects` directory
3. Include comprehensive documentation
4. Submit a pull request

---

{: .note }
Templates are actively maintained and updated with best practices. Check the repository regularly for updates.