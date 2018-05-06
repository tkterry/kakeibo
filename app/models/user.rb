class User < ApplicationRecord
    attr_accessor :remember_token
    has_many :receipt, dependent: :destroy
    has_many :type, dependent: :destroy
    before_save{self.email = email.downcase}
    before_destroy :type_refresh
    after_create :ini_type_create
    validates :name, presence:true, length:{maximum:50}
    # VALID_EMAIL_REGEX=/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    VALID_EMAIL_REGEX=/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence:true, length:{maximum:255}, format:{with:VALID_EMAIL_REGEX}, uniqueness:{case_sensitive:false}
    has_secure_password
    validates :password, presence:true, length:{minimum:6}, allow_nil:true

    def User.digest(string)
        cost=ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
        BCrypt::Password.create(string,cost:cost)
    end

    def User.new_token
        SecureRandom.urlsafe_base64
    end

    def remember
        self.remember_token=User.new_token
        update_attribute(:remember_digest,User.digest(remember_token))
    end

    def authenticated?(remember_token)
        return false if remember_digest.nil?
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    def forget
        update_attribute(:remember_digest,nil)
    end

    def ini_type_create
        titles=['食費',
                '雑貨・日用品費',
                '被服費',
                '交通費',
                '美容費',
                '遊興費',
                '光熱水費',
                '住居費',
                '通信費',
                '教育費',
                '医療費',
                '保険費',
                '交際接待費',
                '未分類']
        titles.each do |t|
            @type=self.type.new(title:t)
            @type.save
        end
    end

    def type_refresh #user削除に伴うtype_destroy時,type modelのini_type_createでtypeお化け生成を防ぐ。
        self.type.delete_all
    end
end
