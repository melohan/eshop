class Company < Client
    def to_s
        "#{brand} (#{type})"
    end
end