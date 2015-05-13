# Spring MVC Scaffold [![Build Status](https://travis-ci.org/juliano/springmvc-scaffold.svg?branch=master)](https://travis-ci.org/juliano/springmvc-scaffold)

Tool to make it easier configuring new Spring MVC projects.

# Installation
Ensure you have installed [ruby](https://www.ruby-lang.org/en/downloads/) and [rubygems](https://rubygems.org/pages/download). Open your terminal and run

    gem install springmvc-scaffold

# Getting Started
Open your terminal and run:
 
    springmvc new myapp

This command will create all configurations, after that go into myapp folder

    cd myapp

Now lets create a sample CRUD, to do that just run

    springmvc scaffold product name:string value:double active:boolean

and run server

    mvn jetty:run
	
Open http://localhost:8080/products

#Supported attributes type

The supported attributes type are: **boolean, double, float, short, integer, long, string, text, date** and **references**.

# Packages
The root default folder is **app**. To change that you have the following command

    springmvc new myapp -p=br.com.simpledev

You can also change the model, controller and repository packages:

    springmvc new myapp -p=br.com.simpledev -m=domain -c=controls -r=data

# Build
The default build tool is maven, to change your build tool, just create your application with:

    # for gradle
    springmvc new myapp -b=gradle

    # for sbt
    springmvc new myapp -b=sbt

When using gradle, to run your application use:

    gradle jettyRun
    # or
    gradle jR

When using sbt use:

    sbt
    container:start

#ORM

A new project already comes with the connection pool configured and in place. Besides that, you can choose between JPA (EntityManager, default), or Hibernate (Session), when creating your project:

    springmvc new myapp -o=jpa
    springmvc new myapp -o=hibernate

#Help command

To get hold of all available commands execute

    springmvc -h

To get more information on a command usage use:

    springmvc new -h
    springmvc scaffold -h

## Note on Patches/Pull Requests
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
* Send me a pull request. Bonus points for topic branches.

## Author

Spring MVC Scaffold was created and is maintained by [Juliano Alves](http://twitter.com/vonjuliano).

