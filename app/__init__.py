from util.bookmark import get_job_details, get_next_file_name, save_job_run_details
from ghactivity_ingest import upload_file_to_s3
import os
def ghactivity_ingest_to_s3():
    bucket_name = os.environ.get('BUCKET_NAME')
    folder = os.environ.get('FOLDER')
    job_details = get_job_details('ghactivity_ingest')
    job_start_time, next_file = get_next_file_name(job_details)
    jobs_run_details=upload_file_to_s3(next_file, bucket_name, folder)
    save_job_run_details(job_details, jobs_run_details, job_start_time)

def lambda_ingest(event, context):
    job_run_details = ghactivity_ingest_to_s3()
    return{
        'status':200,
        'body':job_run_details
    }

    ## build with zip :
    # rm -f GHACTIVITY-AWS.zip
    # python -c "import app;app.ghactivity_ingest_to_s3()"
    # python -c "import app;app.lambda_ingest(None,None)"
    # mkdir -p dependencies
    # pip install -r requirement.txt -t dependencies/
    # cd dependencies/
    # zip -r GHACTIVITY-AWS.zip .
    # mv -f GHACTIVITY-AWS.zip ..
    # zip -r GHACTIVITY-AWS.zip app
    # unzip -t GHACTIVITY-AWS.zip 

# limitation:
# file more than 256 MB will be an issue
    # run shell script : sh -x build.sh