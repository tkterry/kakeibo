class Type < ApplicationRecord
    has_many :receipts
    belongs_to :user
    validates :title,presence:true,length:{maximum:20}
    validates :note,length:{maximum:30}
    validates :user,presence:true
    after_destroy :move_type

    def move_type
        if User.find(self.user_id)
         else_type_create
         @elsetype=Type.where(user_id:self.user_id).find_by(title:'未分類')
         Receipt.where(type:self).update(type:@elsetype)
        end
    end

    def else_type_create
        unless Type.where(user_id:self.user_id).find_by(title:'未分類')
         @type=Type.new(title:'未分類',user:self.user)
         @type.save
        end
    end
end
