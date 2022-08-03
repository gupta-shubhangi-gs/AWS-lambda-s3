# to make things working we 
#base image from which custom doker is built
FROM  public.ecr.aws/lambda/python:3.9 
#this will copy requirements.txt to root of docker image
COPY requirements.txt requirements.txt 
# with run we can issue any valid command which we want to runin building custom docket image(install dependencies)
Run pip install -r requirements.txt 
# copy app from source to the target image
COPY app ${LAMBDA_TASK_ROOT}/app 
# environment variablen in custom docker image
ENV PYTHONPATH=${LAMBDA_TASK_ROOT}/app  
# Lambda handler
CMD ["app.lambda_ingest"] 

# docker buid -t ghactivity-aws-lambda .
# docker images

## create container for the docker image : image is from name ghactivity-aws-lambda
# docker run --name ghactivity-aws-lambda (container anyname) -d ghactivity-aws(image-name:tag if tag is latest then only image name)
#docker run --name ghactivity-aws-lambda -d ghactivity-aws-lambda

# container is running or not: docker ps

# attched the image to container:  docker exec -it ghactivity-aws-lambda bash

## check the env variable: env
# important env variable : LAMBDA_TASK_ROOT
# LAMBDA_TASK_ROOT fetch from base image

#docker help
#docker cp -h

#copying container to docker for aws profile
#docker cp ~/.aws ghactivity-aws-lambda:/root 

#export BUCKET_NAME=sgghactivity
#export FOLDER=landing


## deleting running container
#docker rm ghactivity-aws-lambda -f

## create container with all the depandencies
#mount  ls -altr ~|grep aws to docker container
#docker run --name ghactivity-aws-lambda -p 9080(anyport):8080-v /User/shubhangigupta/aws:/root/.aws -e AWS_PROFILE=ghactivity -e BUCKET_NAME=sgghactivity -e FOLDER=landing -d ghactivity-aws-lambda

## curl -XPOST\
#"http://localhost:9080/2-15-03-1/functions/function/invocation"
# if any argument is required to pass in the event -d '{}'

#docker logs -f ghactivity-aws-lambda(container)


## ECR Elastic container registry
#export AWS_Profile
# get ecr login password : generate token and passed do docker
#aws ecr get-login-password \
    #--region us-east-1 | \
    #docker login 
    #--username AWS --password-stdin 801172579888.dkr.ecr.us-east-1.amazonaws.com


#docker build -t ghactivity-aws-lambda .

#docker tag ghactivity-aws-lambda:latest 801172579888.dkr.ecr.us-east-1.amazonaws.com/ghactivity-aws-lambda:latest

#docker push 801172579888.dkr.ecr.us-east-1.amazonaws.com/ghactivity-aws-lambda:latest

# with docker container we can change CMD override, ENTRYPOINT override
