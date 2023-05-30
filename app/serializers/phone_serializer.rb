class PhoneSerializer < ActiveModel::Serializer
    attributes :id, :number
    belongs_to :contact do
      link(:related) { contact_phone_url(object.contact.id)}
  end
end
  