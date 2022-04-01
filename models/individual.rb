class Individual < Client
    validates :firstname, :lastname, presence: true, length: { minimum: 3 }
end