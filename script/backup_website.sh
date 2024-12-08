#!/bin/bash

# Set variables
DB_USER="formuser"                       # Database user
DB_PASS="securepassword"                 # Database password
DB_NAME="formdb"                         # Database name
BACKUP_DIR="backups"                     # Directory to store backups
DATE=$(date +'%Y-%m-%d_%H-%M-%S')        # Timestamp for backup
APACHE_CONF="/etc/apache2/sites-available"  # Apache configuration files
NGINX_CONF="/etc/nginx/sites-available"     # Nginx configuration files
WEBSITE_DATA="/var/www"                  # Website files location

# Create the backup directory if it doesn't exist
if [ ! -d "$BACKUP_DIR" ]; then
    echo "Creating backup directory $BACKUP_DIR..."
    mkdir -p "$BACKUP_DIR"
    chmod 755 "$BACKUP_DIR"  # Set the proper permissions
fi

# Backup MySQL database
echo "Backing up MySQL database..."
mysqldump -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" > "$BACKUP_DIR/$DB_NAME-$DATE.sql"
if [ $? -eq 0 ]; then
    echo "Database backup successful!"
    echo "Backup file created: $BACKUP_DIR/$DB_NAME-$DATE.sql"
else
    echo "Database backup failed!" >&2
    exit 1
fi

# Backup Apache2 configuration files
echo "Backing up Apache2 configuration files..."
tar -czf "$BACKUP_DIR/apache2-config-$DATE.tar.gz" "$APACHE_CONF"
if [ $? -eq 0 ]; then
    echo "Apache2 configuration backup successful!"
else
    echo "Apache2 configuration backup failed!" >&2
    exit 1
fi

# Backup Nginx configuration files
echo "Backing up Nginx configuration files..."
tar -czf "$BACKUP_DIR/nginx-config-$DATE.tar.gz" "$NGINX_CONF"
if [ $? -eq 0 ]; then
    echo "Nginx configuration backup successful!"
else
    echo "Nginx configuration backup failed!" >&2
    exit 1
fi

# Backup website data
echo "Backing up website data..."
tar -czf "$BACKUP_DIR/website-data-$DATE.tar.gz" "$WEBSITE_DATA"
if [ $? -eq 0 ]; then
    echo "Website data backup successful!"
else
    echo "Website data backup failed!" >&2
    exit 1
fi

# Compress all backups into one archive
echo "Creating a final backup archive..."
tar -czf "$BACKUP_DIR/full-backup-$DATE.tar.gz" "$BACKUP_DIR"/*.tar.gz "$BACKUP_DIR"/*.sql
if [ $? -eq 0 ]; then
    echo "Final archive created successfully!"
    # Clean up individual backup files
   # rm -f "$BACKUP_DIR"/*.tar.gz "$BACKUP_DIR"/*.sql
else
    echo "Failed to create final archive!" >&2
    exit 1
fi

echo "Backup completed! All backups are stored in $BACKUP_DIR."
