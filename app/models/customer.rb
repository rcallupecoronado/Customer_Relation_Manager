class Customer < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["id", "full_name", "phone_number", "email_address", "notes", "created_at", "updated_at"]
  end

    # ✅ Permitir la asignación masiva de atributos
    def self.permitted_attributes
      ["full_name", "phone_number", "email_address", "notes"]
    end
end
