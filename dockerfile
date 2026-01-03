FROM dpage/pgadmin4:latest

# Minimal demo change: add a file so the image is "yours"
USER root
RUN echo "Built by GitHub Actions" > /built-by-ci.txt
USER pgadmin
