docker rmi 801172579888.dkr.ecr.us-east-1.amazonaws.com/ghactivity-aws-lambda:latest
docker rmi ghactivity-aws

docker build -t ghactivity-aws .

export AWS_PROFILE=ghactivity

aws ecr get-login-password \
    --region us-east-1 | \
    docker login 
    --username AWS --password-stdin 801172579888.dkr.ecr.us-east-1.amazonaws.com


docker build -t ghactivity-aws-lambda.

docker tag ghactivity-aws-lambda:latest 801172579888.dkr.ecr.us-east-1.amazonaws.com/ghactivity-aws-lambda:latest


aws ecr list-images \
    --repository-name ghactivity-aws-lambda
    
aws lambda get-function \
    --function-name ghactivity-ingestor

aws lambda get-function-configuration \
    --function-name ghactivity-ingestor

docker run \
  --name ghactivity-aws-lambda \
  -p 9080:8080 \
  -v /Users/itversity/.aws:/root/.aws \
  -e AWS_PROFILE=ghactivity \
  -e BUCKET_NAME=landing \
  -e FOLDER=landing \
  -e TARGET_FOLDER=raw\
  -d \
ghactivity-aws-lambda

curl -XPOST \
  "http://localhost:9080/2015-03-31/functions/function/invocations" \
  -d '{"jobRunDetails": {"last_run_file_name": "2022-06-05-2.json.gz"}}'