# Permitir que Ransack busque dentro de ActiveStorage
Rails.application.config.to_prepare do
  ActiveStorage::Attachment.class_eval do
    def self.ransackable_attributes(auth_object = nil)
      ["blob_id", "created_at", "id", "name", "record_id", "record_type"]
    end
  end

  ActiveStorage::Blob.class_eval do
    def self.ransackable_attributes(auth_object = nil)
      ["content_type", "created_at", "filename", "id", "metadata", "service_name", "byte_size"]
    end
  end
end