# Three Tier Architecture

## Elements

A three tier architecture is composed of the following elements:

### Presentation Tier
The presentation tier is the graphical user interface tier that is presented to the user. 
An example of popular web development frameworks used to develop graphical user interface are:

- Node.js
- ReactJS
- AngularJS
- VueJS


### Application/Logic Tier
The application, or logic tier manages the core business logic of the application, and it is from here that the data from the presentation tier is pulled. 
An example of popular programming languages used to develop the application/logic tier of an application are:

- Java
- Go
- Python
- PHP

### Data Tier
The data tier would contain the persistent data storage, for example, the databases. 

## Tools
The exercise requests that automation is a key focus, so I have used terraform to implement the creation of the infrastructure on AWS.

### AWS Environment
The terraform creates a standard AWS VPC consisting of a public and private subnet. 

#### Public Subnet

The public subnet would contain the web servers that serve traffic to the users and have access to the internet,

#### Private Subnet
The private subnet would contain the application servers, and depending on the type of database and service used, potentially the database servers.

The application servers would be in a private subnet for security purposes, would expose an api, and access would be managed via security rules. Any ssh access would be using a bastion server.

AWS provide a range of AWS managed and customer managed database services. Depending on the type of database service, it may or may not rqeuire EC2 instances or other additional infrastructure dependencies.