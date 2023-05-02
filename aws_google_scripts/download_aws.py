import boto3
import botocore

def s3_download(
        bucket_name:str = None,
        filename:str = None,
        filepath:str = None):
    """Downloading s3 file"""
    s3 = boto3.resource('s3')

    try:
        s3.Bucket(bucket_name).download_file(filename, filepath)
    except botocore.exceptions.ClientError as e:
        if e.response['Error']['Code'] == "404":
            print("The object does not exist.")
        else:
            raise    

if __name__ == "__main__":
    bucket_name = 'spacenet-dataset/spacenet/SN6_buildings/tarballs'
    filename = 'SN6_buildings_AOI_11_Rotterdam_test_public.tar.gz'
    filepath = '/home/vardh/gcp_projects/planet-ml/data/sn6_test.zip'
    s3_download(bucket_name, filename, filepath)