#!/bin/zsh

echo "📦 Starting Leantime Automated Backup..."

# Navigate to project directory
cd ~/Documents/Areas/leantime-personal || exit 1

# Check if Docker/Colima is actually running before trying to dump
if ! docker info >/dev/null 2>&1; then
    echo "⚠️ Docker daemon is not running! Cannot take backup."
    exit 1
fi

# 1. Dump MySQL Database
echo "🗄️  Dumping database..."
docker exec -T mysql_leantime mysqldump -u root -pyour_secure_root_password leantime_db > ./leantime_backup.sql

# 2. Copy & Compress User Images/Assets
echo "🖼️  Compressing uploaded images..."
docker cp leantime_app:/var/www/html/userfiles ./userfiles_temp
tar -czf ./userfiles_backup.tar.gz -C ./userfiles_temp .
rm -rf ./userfiles_temp

# 3. Commit and Push to Private GitHub Repo
echo "🚀 Pushing backup to GitHub..."
git add leantime_backup.sql userfiles_backup.tar.gz
git commit -m "Auto-backup: $(date +'%Y-%m-%d %H:%M')"
git push origin main

# 4. Stop Containers & Colima
echo "🛑 Shutting down Leantime & Colima..."
docker compose down
colima stop

echo "✅ Backup complete! Systems safely shut down."
