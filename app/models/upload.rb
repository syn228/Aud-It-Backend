class Upload < ApplicationRecord
  def create
    s3 = Aws::S3::Resource.new(region: 'us-east-2')

    file = 'C:\file.txt'
    bucket = 'aud-it-pictures'
          
    # Get just the file name
    name = File.basename(file)

    # Create the object to upload
    obj = s3.bucket(bucket).object(name)

    # Upload it      
    obj.upload_file(file)
  end

end
