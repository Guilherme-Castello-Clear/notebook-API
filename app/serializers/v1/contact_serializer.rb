module V1
    class ContactSerializer < ActiveModel::Serializer
        attributes :id, :name, :email, :birthdate
        
        belongs_to :kind, optional: true do
            link(:related) { v2_contact_kind_url(object.id) }
        end
    
        has_many :phones do
            link(:related) { v2_contact_phone_url(object.id) }
        end
        
        has_one :address do
            link(:related) { v2_contact_address_url(object.id) }
        end
    
    
        meta do{
            author: "Castello" }
        end
    
    
        def attributes(*args)
            h = super(*args)
            #h PTBT [:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?)
            h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
            h
        end
    end
end