# AntiBupt
Beijing University of Posts and Telecommunications International College e-commerce and law short semester project

# Way to Use
Small website for shopping including server and database

step 1
download the project to your eclipse and Name as MecDog

step 2
load the sql file to your mysql. The database should name as "website"

step 3

Configure the tomcat server for the project in eclipse.(larger than 9.0)

step 4
The external jar package (mysql-connecter, Gson, protubuf) that the project needs to use is in lib. If the version is wrong, please look for the corresponding version on maven.

step 5
Connect to http://localhost:8080/MecDog to visit your website.

# technical details
# front end
The design is relatively simple, completely using the native javascript and jquery splicing interface

Front-end framework uses bootstrap

The paging plugin uses bootstrap-paginator

# backend
Implementing RESTful APIs with native java servlets

Implementing Serialization via Gson

Database connected via  mysql-connector-java and commons-dbutils-1.7

# Management and maintenance
the description and photo of each commodity are save in /text and /WebContent/img.
if you want to add a commodity in your website, just add a picture with the same name of the commodity and a txt file with the same name of the commodity after change your database.
Deleting is in the same way.
# Recommendation system
There is a Jupyter notebook in the project. When you think that the website has experienced such an increase in the number of transactions that you need to update the recommendation system (our vectorized recommend system is based on history) or your product list changed(it's important!!!), run the jupyter notebook and copy the txt file(vector.txt) to the directory "/build/classes/statistic" and cover the original file.