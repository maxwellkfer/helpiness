class AvatarUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave

  process eager: true  # Force version generation at upload time.

  process convert: 'jpg'

  version :thumnail do
    resize_to_fit 256, 256
  end

  version :bright_face do
    cloudinary_transformation radius: 100,
      width: 120, height: 120, crop: :thumb, gravity: :face
  end

  version :show_face do
    cloudinary_transformation radius: 100,
      width: 80, height: 80, crop: :thumb, gravity: :face
  end

end

