#CiviCRM 5.16.1 and Drupal 7.67

####Install steeps:
1.  Run "sudo chmod 777 -R www"
2.  Run "sudo docker-compose up"

####Drupal:   
login: admin  
Password: admin_admin

####Docker   
Install 'docker' and 'docker-compose'   
Database password and user gets from 'docker-compose.yml' file   
Be attention docker uses standard ports   

####Git   
1.  Set correct user name and user email for git config:
    1. git config --local user.name UserName  
    2. git config --local user.email useremail@gmail.com  
2.  Run "git config core.autocrlf false" 
3.  Run "git config core.fileMode false"