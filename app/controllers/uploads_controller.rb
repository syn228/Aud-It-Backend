class UploadsController < ApplicationController
  def index
    render json: Upload.all
  end

  def show 
    render json: Upload.find_by(id: params[:id])
  end

  def create


    s3 = Aws::S3::Resource.new(
    credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY']),
    region: ENV['AWS_REGION'],
    endpoint:'https://s3.us-east-1.amazonaws.com'
    )
    
    file = params[:attachment].tempfile.path
    file_name = params[:attachment].original_filename
    bucket = 'aud-it-pictures'
          
    # Get just the file name
    name = File.basename(file)

    # Create the object to upload
    obj = s3.bucket(bucket).object(name)

    # Upload it      
    obj.upload_file(file, acl: 'public-read')

    upload = Upload.new

    upload.name = file_name
    upload.path = "https://s3.amazonaws.com/aud-it-pictures/#{name}"

    upload.save

    

  end

end
