## Getting Started

### Suggested tools

Installation
------------

- Ruby Version Manager - [rvm](http://rvm.beginrescueend.com/)
- Git
- MySQL
- rvm

Important for Application
=========================

- ruby 2.1.5p273 (install by using rvm)
- gem install rails (version 3.2.13)


Steps to create and initialize the database
===========================================

### Create databases

    $ rake db:create:all
    $ rake db:schema:load
    or
    $ rake db:migrate


Steps to prepare the source code.
=================================

### Create rvm gemset (if using RVM)

    $ rvm --create use 2.1.5@schedular

### Install gems

    $ gem install bundler
    $ gem install rails (version 3.2.13)

### Change directory to "task_schedular" and start the web server:

    $ cd [path_to]/task_schedular

### Run following Commands:

    $ bundle install

### Create databases

    $ rake db:create:all
    $ rake db:schema:load
    or
    $ rake db:migrate

### Start your server

    $ rails server
    or
    $ rails s

### Start Other Server

    $ rake jobs:work

### Open following link in browser

    http://localhost:3000/

# API LINKS

### You can use POSTMAN (an extension of Google Chrome)
>> Import API END POINTS using POSTMAN through

- the link https://www.getpostman.com/collections/9997030a6d846f50907b

>>  OR

- the file "TaskSchedular.json.postman_collection" (find this file in current folder)

>> Or can use other method to hit API calls with following credentials:

- Authorization: 195b4a5bb185ef3f43dc5288b79386be
- GET: To get all tasks: http://localhost:3001/api/v1/schedular/tasks
- POST: To schedule task: http://localhost:3000/api/v1/schedular/schedule_task
- GET: To get all task by ID : http://localhost:3000/api/v1/schedular/task?id=<:id>
- Following Form Data

```
name: Task Name
path: Task Path
run_at: Time in valid ruby formate*
```

### Note the `ruby date formate` should be valid or one of the following

    1) 2015-08-19 19:35:46 +0500
    2) Wed, 19 Aug 2015 14:40:57 UTC +00:00
    3) Wed, 19 Aug 2015 14:40:57
    4) Wed, 19 Aug 2015
    5) 2015-08-19
    6) 2015-08-19 19:35:46

