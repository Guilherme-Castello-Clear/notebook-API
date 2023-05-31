module V2
    class ContactSerializer < ActiveModel::Serializer
        attributes :id, :name, :email
        
        belongs_to :kind, optional: true do
            link(:related) { v1_contact_kind_url(object.id) }
        end
    
        has_many :phones do
            link(:related) { v1_contact_phone_url(object.id) }
        end
        
        has_one :address do
            link(:related) { v1_contact_address_url(object.id) }
        end
    end
end