class Material < ApplicationRecord
  belongs_to :discipline
  has_one_attached :file

  validates_attachment_content_type :file, content_type: ['application/pdf', 'text/plain', 'image/jpeg', 'image/png', 'application/vnd.ms-excel', 'application/msword']

  def file_url
    file.url
  end
end
