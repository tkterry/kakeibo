class Type < ApplicationRecord
    has_many :receipts
    validates :title,presence:true,length:{maximum:20},uniqueness:{case_sensitive:false}
end
