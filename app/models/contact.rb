class Contact < ApplicationRecord
    belongs_to :kind, optional: true
    
   # def author
   #     "Castello"
   # end

   # def as_json(options={})
   #     super(root: true, methods: [:author, :kind_description])
   #end
   # def kind_description
   #     self.kind.description
   # end
end
