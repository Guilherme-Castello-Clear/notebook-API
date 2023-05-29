class Contact < ApplicationRecord
    belongs_to :kind, optional: true
    has_many :phones

    accepts_nested_attributes_for :phones
    def birthdate_br
        I18n.l(self.birthdate) unless self.birthdate.blank?
    end
    def as_json(options = {})
        h = super(options)
        h[:birthdate] = (I18n.l(self.birthdate) unless self.birthdate.blank?)
        h
    end
    def to_br
        {
            name: self.name,
            email: self.email,
            birthdate: (I18n.l(self.birthdate) unless self.birthdate.blank?),
            
        }
    end
   # def author
   #     "Castello"
   # end

   # def as_json(options={})
   #     super(root: true, methods: [:author, :kind_description])
   #end
   # def kind_description
   #     self.kind.description
   # end


   def hello
    I18n.t('hello')
   end

   def i18n
    I18n.default_locale
   end
end
