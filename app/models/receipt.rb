class Receipt < ApplicationRecord
    belongs_to :type
    validates :payment,presence:true
    validates :p_date,presence:true
    validates :type_id,presence:true
end
