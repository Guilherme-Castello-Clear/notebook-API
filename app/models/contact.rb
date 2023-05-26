class Contact < ApplicationRecord
    belongs_to :kind
    
    def author
        "Castello"
    end

    def as_json(options={})
        super(methods: :author, root: true)
    end
end
