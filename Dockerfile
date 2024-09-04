# syntax=docker/dockerfile:1
# First Stage: Create index.html
FROM alpine:3.16 AS builder

# Create the index.html file
RUN echo "<p>Hello World</p>" > /index.html

# Second Stage: NGINX image
FROM nginx:alpine

# Copy the generated index.html from the first stage
COPY --from=builder /index.html /usr/share/nginx/html/

# Print "starting nginx"

CMD ["echo", "starting nginx","&&","nginx", "-g", "daemon off;"]