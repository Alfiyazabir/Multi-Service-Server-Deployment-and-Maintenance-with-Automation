# Multi-Service Server Deployment and Maintenance with Automation

## **Objective**
This project sets up a Linux server environment that includes:
- **Web Hosting**: Hosts a website using **Nginx** and **Apache2**.
- **User Management**: Implements role-based access control.
- **Database Integration**: Uses **MySQL** for dynamic website content.
- **Backup Automation**:
  - Automated backups of website data, configuration files, and databases.
  - Data compression and archiving using **shell scripts**.
  - Scheduled execution using **cron jobs**.

## **Key Features**
1. **Dual Web Server Setup**:
   - Nginx serves as a reverse proxy for Apache2.
   - Optimized for load balancing and fault tolerance.

2. **Role-Based User Management**:
   - Secure user access with custom roles and permissions.
   - Includes scripts for adding, deleting, or modifying users.

3. **Database Integration**:
   - MySQL setup for storing and retrieving dynamic content.
   - Includes secure credentials management.

4. **Automated Backup System**:
   - Regular backups of:
     - Website content
     - Configuration files
     - MySQL databases
   - Uses shell scripts for compression (`tar` and `gzip`) and archival.
   - Schedules backups with **cron jobs** for daily/weekly execution.

5. **Scalable and Modular**:
   - Easy to extend for additional services or platforms.
   - Includes comments and modular scripts for customization.

## **Technologies Used**
- **Operating System**: Linux (Ubuntu/Debian recommended)
- **Web Servers**: Nginx, Apache2
- **Database**: MySQL
- **Automation**: Shell scripts, cron jobs
- **Compression Tools**: tar, gzip

## **Setup and Usage**
### **1. Prerequisites**
- A Linux server (Ubuntu/Debian)
- Root or sudo privileges
- Basic knowledge of shell scripting and Linux commands

### **2. Installation**
1. Clone this repository:
   ```bash
   git clone https://github.com/Alfiyazabir/Multi-Service-Server-Deployment-and-Maintenance-with-Automation.git
   cd multi-service-deployment-automation
   
2. Run the setup script:

```bash
sudo ./setup.sh
```
This will:
- Install Nginx, Apache2, and MySQL.
- Set up initial user roles.
- Configure the backup scripts.
- Configure the config.env file with database credentials and backup paths:

```bash
DB_USER="your_db_user"
DB_PASSWORD="your_db_password"
BACKUP_DIR="/path/to/backup/directory"
```

3. Schedule Automated Backups
- The setup script configures cron jobs automatically, but you can modify them:
- Edit the cron job:
```bash
crontab -e
```
- Example schedule (daily at 2 AM):
```cron
0 2 * * * /path/to/backup_script.sh
```
4. Verify Deployment
Access the hosted website at http://<server-ip>.
- Check backup archives at the specified directory.

Contributing
- Feel free to fork this repository, open issues, or submit pull requests. Contributions are always welcome!
