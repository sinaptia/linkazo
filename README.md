# Linkazo

A modern link tree application built with Ruby on Rails. Create your personalized link tree and share all your important links in one place.

## Features

- 🔗 **Link Management**: Create, edit, and organize your links
- 🎨 **Custom Theming**: Personalize your profile with custom colors and themes
- 📱 **Mobile-First Design**: Optimized for mobile devices and social media sharing
- 👤 **User Profiles**: Custom usernames and profile pages

## Getting Started

### Prerequisites

- Docker and Docker Compose
- Git

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd linkazo
```

2. Build and start the application:
```bash
docker-compose up --build
```

3. The application will be available at `http://localhost:3000`

### Development

- **Start the application**: `docker-compose up`
- **Run database migrations**: `docker-compose exec web bin/rails db:migrate`
- **Access Rails console**: `docker-compose exec web bin/rails console`
- **Run RuboCop**: `./bin/rubocop`
- **Auto-fix RuboCop issues**: `./bin/rubocop -A`

## Usage

1. **Sign Up**: Create a new account at `/users/sign_up`
2. **Dashboard**: Manage your links at `/dashboard`
3. **Profile**: View your public profile at `/:username`
4. **Settings**: Customize your profile and theme at `/settings`

## Configuration

### Environment Variables

For production deployment, set:
- `LINKAZO_DATABASE_PASSWORD`: Database password
