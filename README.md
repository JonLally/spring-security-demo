# Spring Boot Security

This project uses the following:
- Gradle
- Java 8
- Spring boot data rest
- Spring boot actuator
- Spring boot security
- H2
- httpie (for hitting endpoints)

## Introduction

Spring boot security takes an opinionated view on security using best practices. The purpose of this 
project is to serve as a guide showcasing how to configure Spring boot security for some real world 
scenarios. The real world scenario here will be a taxi company wishing to create a system for their 
drivers and admin staff to manage their fares.

There will be 3 tables
- Users - the users or employees of the taxi company
- Roles - Basic authorities for each user (DRIVER, ADMIN) 
- Jobs - manages a queue of jobs.

As we progress we will look at the Authentication ("I am") and Authorization ("I can"). Each 
iteration will be captured in a branch to allow easier understanding rather than providing the 
finished product.

## Basic out of the box Spring Boot Security

This is the basic out of the box configuration. We have added debug logging for spring security in
a configuration class. The database (h2) is set up with a schema and some data.

When you start the application you will notice the following output:
```
2020-11-08 15:53:19.905  INFO 2230 --- [  restartedMain] .s.s.UserDetailsServiceAutoConfiguration : 

Using generated security password: 1acbb68b-ee81-467a-b41d-5ee7b04aea81
```

This is because Spring boot security configures a basic user called "user" and a password which is 
generated and displayed in the line above. We can now use this generated password to access the REST 
API.

```bash
➜  spring-security-demo git:(master) ✗ http -a user:1acbb68b-ee81-467a-b41d-5ee7b04aea81 :8080/jobs
HTTP/1.1 200 
Cache-Control: no-cache, no-store, max-age=0, must-revalidate
Connection: keep-alive
Content-Type: application/hal+json
Date: Sun, 08 Nov 2020 15:53:56 GMT
Expires: 0
Keep-Alive: timeout=60
Pragma: no-cache
Set-Cookie: JSESSIONID=FD3BE0977FE7E6840765383D62505794; Path=/; HttpOnly
Transfer-Encoding: chunked
Vary: Origin
Vary: Access-Control-Request-Method
Vary: Access-Control-Request-Headers
X-Content-Type-Options: nosniff
X-Frame-Options: DENY
X-XSS-Protection: 1; mode=block

{
    "_embedded": {
        "jobs": [
            {
                "_links": {
                    "job": {
                        "href": "http://localhost:8080/jobs/1"
                    },
                    "self": {
                        "href": "http://localhost:8080/jobs/1"
                    },
                    "user": {
                        "href": "http://localhost:8080/jobs/1/user"
                    }
                },
                "completed": true,
                "creationDate": "2020-09-17T18:47:52.69"
            },
            {
                ...
            },
            {
                ...
            },
            {
                ...
            }
    },
    "page": {
        "number": 0,
        "size": 20,
        "totalElements": 4,
        "totalPages": 1
    }
}
```

If we were to leave out the ```-a user:1acbb68b-ee81-467a-b41d-5ee7b04aea81``` then we would get a 
401 response meaning we failed Authentication.



