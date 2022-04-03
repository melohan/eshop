class Comment < ActiveRecord::Base

    belongs_to :target, polymorphic: true
    belongs_to :author, class_name: 'Client'

    def to_s
        "#{body}"
    end

end