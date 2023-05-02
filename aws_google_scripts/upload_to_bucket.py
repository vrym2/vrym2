import os
import logging
import click
import shutil
import subprocess as sp
from google.cloud import storage
from google.api_core.exceptions import NotFound

class GoogleBuckets:
    """Class function related to Google Buckets"""
    def __init__(
            self,
            local_filepath: str = None,
            bucket_path:str = None,
            log: isinstance = None) -> None:
        """Initiating Google Client
        
        Args:
            local_filepath: Relative path of the file needs to be uploaded
            bucket_path: bucket path of the file uploading
            log: instance of custom logger function
        """
        self.log = log
        self.local_filepath = local_filepath
        self.bucket_path = bucket_path
        self.client = storage.Client()

        if self.log is None:
            self.log = logging.getLogger(__name__)
        else:
            pass

        # Getting the filename
        self.filename = os.path.basename(self.local_filepath)
        self.abs_filepath = os.path.join(os.getcwd(), self.local_filepath)        
    
    def upload(self)-> None:
        """Uploading to the GCP buckets"""

        if os.path.exists(self.abs_filepath):
            # Listing files in the bucket
            self.bucket_name = self.bucket_path.split('/')[0]
            self.blobs = self.client.list_blobs(self.bucket_name)
            try:
                self.bucket_files = [blob.name.split('/')[-1] for blob in self.blobs]
            except NotFound:
                self.log(f"bucket{self.bucket_name} is not found in GCP")
            else:
                if self.filename not in self.bucket_files:
                    self.log.info(f"file {self.filename} not found in GCP")
                    self.log.info("Commencing upload!")
                    # Uploading file
                    sp.check_call(f'gsutil cp -r {self.abs_filepath} gs://{self.bucket_path}', 
                                shell = True, stdout = sp.PIPE)
                    self.log.info("Upload finished")
                else:
                    self.log.debug(f"{self.filename} exists in GCP")
        else:
            self.log.debug(f"file {self.local_filepath} does not exist")
    
    def upload_large_files(self)-> None:
        """Upload very large files"""
        if os.path.exists(self.abs_filepath):
            self.log.info("Commencing upload!")
            sp.check_call(f'gcloud storage cp {self.abs_filepath} gs://{self.bucket_path}')
            self.log.info("Upload finished")
        else:
            self.log.debug(f'File {self.abs_filepath} does not exist')

    def remove_uploaded_files(self)-> None:
        """Removing files from local system"""
        # Removing file
        if os.path.exists(self.abs_filepath):
            shutil.rmtree(self.abs_filepath, ignore_errors = True)
        else:
            self.log.debug(f"file {self.abs_filepath} does not exist")


@click.command()
@click.option('--filepath', help = 'Give a path of file to upload')
@click.option('--bucket_path', help = 'Path to the bucket in Google storage')
def cli_upload(filepath, bucket_path):
    upload_data = GoogleBuckets(filepath, bucket_path)
    filesize = os.stat(filepath).st_size
    if filesize <= 10:
        upload_data.upload()
    else:
        upload_data.upload_large_files()
    upload_data.remove_uploaded_files()

if __name__ == "__main__":
    cli_upload()
        