#https://www.section.io/engineering-education/django-docker/
#https://www.youtube.com/watch?v=gAkwW2tuIqE
#https://towardsdatascience.com/deploying-a-docker-container-with-ecs-and-fargate-7b0cbc9cd608
#https://faun.pub/setting-up-ci-cd-using-docker-aws-ecr-and-github-actions-part-1-66d7dc640e4d
FROM python:3.8.3-alpine

# set work directory
WORKDIR  /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies
RUN pip install --upgrade pip 
COPY ./requirements.txt /usr/src/app
RUN pip install -r requirements.txt

# copy project
COPY . /usr/src/app

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]