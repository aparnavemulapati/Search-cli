class SearchableEntity
  attr_reader :key, :value, :data
  def initialize(key, value)
    @key = key
    @value = value || ''
    @data = JSON.parse(File.read(self.class::JSON_FILENAME))
  end

  def search
    results = []
    # Loop over the dataset
    data.each do |obj|
      # If the key has an array value, we need to check if the search value
      # is included in this array.
      if obj[key].is_a?(Array) && obj[key].any? { |v| v.to_s.casecmp(value) == 0 }
        results << obj
      # If the key has a primitive value, compare it with search value. [Case Insensitive]
      elsif obj[key].to_s.casecmp(value) == 0
        results << obj
      end
    end
    results
  end
end
