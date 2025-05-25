# Custom API Project

A Django REST Framework-based API project with PostgreSQL, JWT authentication, custom user model, Docker support, and automatic superuser creation.

## 🌐 Project Features

- 🔐 Custom User Model with JWT Authentication
- 🛠️ Dockerized for development and production
- 🐘 PostgreSQL as the primary database
- 📁 Static and media file support
- 🧪 Modular Django app structure
- ⚙️ Automatic superuser creation via environment variables
- 🚀 Ready for deployment with Docker Compose

---

## 📦 Project Structure

```
custom_api_project/
├── users/                # Custom user app
├── products/             # Sample app (example: Product listing)
├── core/                 # Settings, base config
├── entrypoint.sh         # Entrypoint for Docker container
├── Dockerfile            # Docker image instructions
├── docker-compose.yml    # Docker Compose services
├── requirements.txt      # Python dependencies
└── .env                  # Environment variables (excluded from Git)
```

---

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/OmerGokdemir/custom_api_project.git
cd custom_api_project
```

### 2. Create `.env` File

Create a `.env` file in the root directory and paste the following content (you may customize it):

```env
# Django settings
DJANGO_DEBUG=True
DJANGO_SECRET_KEY=your-secret-key
DJANGO_ALLOWED_HOSTS=localhost,127.0.0.1

# Superuser settings
DJANGO_SUPERUSER_USERNAME=admin
DJANGO_SUPERUSER_EMAIL=admin@example.com
DJANGO_SUPERUSER_PASSWORD=admin1234

# PostgreSQL settings
POSTGRES_DB=database_name
POSTGRES_USER=database_user
POSTGRES_PASSWORD=password
POSTGRES_HOST=db
POSTGRES_PORT=5432

# Static and media files
STATIC_URL=/static/
STATIC_ROOT=/vol/web/static
MEDIA_URL=/media/
MEDIA_ROOT=/vol/web/media
```

> ✅ `.env` file is excluded from version control via `.gitignore`.

---

## 🐳 Run with Docker

Make sure Docker and Docker Compose are installed.

```bash
docker-compose up --build
```

This will:

- Build the Docker images
- Run PostgreSQL and Django containers
- Apply migrations
- Automatically create a superuser

Access the app at: [http://localhost:8000](http://localhost:8000)

---

## ⚙️ Useful Commands

- Run migrations manually:

  ```bash
  docker-compose exec web python manage.py migrate
  ```

- Create superuser manually:

  ```bash
  docker-compose exec web python manage.py createsuperuser
  ```

- Collect static files:

  ```bash
  docker-compose exec web python manage.py collectstatic --noinput
  ```

---

## 🧪 API Endpoints (Sample)

You can explore API endpoints using tools like:

- [Postman](https://www.postman.com/)
- [httpie](https://httpie.io/)
- Django REST Framework’s browsable API at `/api/`

---

## 📂 Deployment Notes

> ⚠️ This project is using Django's development server and should not be used in production without proper setup (gunicorn, nginx, HTTPS, etc.).

---

## 👨‍💻 Author

- **Omer Gokdemir**
🧑‍💻 Django Developer

📩 Reach me on [LinkedIn](https://www.linkedin.com/in/omer-gokdemir/) | [Upwork](https://www.upwork.com/freelancers/~01cf80f9e22cf120e3)

GitHub: [@OmerGokdemir](https://github.com/OmerGokdemir)

---

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
