# DevOps Coding Exercise

This repository contains solutions to various DevOps exercises, providing a hands-on experience with different DevOps tools and practices.

## Table of Contents

- [Exercise 1](#exercise-1)
- [Exercise 2](#exercise-2)
- [Exercise 3](#exercise-3)
- [Exercise 4](#exercise-4)
- [Troubleshooting](#troubleshooting)
- [Next Steps](#next-steps)

## Exercise 1

- **Script:** `Excercise1.sh`
  - **Description:** Executes and prints all Instance IDs. The objective is to filter and print only the Instance IDs that were launched before `2022-04-12T13:00:00`.
  
- **Script:** `Excercise1_timestamp.sh`
  - **Description:** Attempts to convert the timestamp for accurate filtering. Error debugging is currently in progress.

## Exercise 2

- **Description:** Created AWS groups and users using Terraform based on the provided local variable configuration.

## Exercise 3

- **First Stage:**
  - Generated an `index.html` file containing the text "Hello World".
  - Used an Alpine Linux image as the builder.

- **Second Stage:**
  - Used an NGINX image.
  - Copied the generated `index.html` file.
  - Printed "starting nginx" and started NGINX in the foreground using `nginx -g 'daemon off;'`.
  
- **Execution:** 
  - Used Docker Desktop for Windows.
  - Encountered a "Connection refused" error when accessing `http://localhost:8080`. Debugging is currently in progress.

## Exercise 4

- **Description:** Created a Kubernetes pod with init containers that clone a text file and place it in `/data/myfile`.
- **Status:** Build was successful, but the connection was refused. Debugging is in progress.

## Troubleshooting

- **Docker and Kubernetes Issues:** Encountering issues with Docker and Kubernetes on my laptop. Currently working on resolving these by launching a Linux instance on AWS.

## Next Steps
- Resolve the timestamp issue in Excercise 1.
- Resolve the connection issues in Exercises 3 and 4.
- Set up a Linux instance on AWS for better stability with Docker and Kubernetes.

  
    
        





