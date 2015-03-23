module Searchable
  def where_ilike search_hash
    attributes = search_hash.keys
    result = self
    attributes.each do |attribute|
      query = search_hash[attribute]
      result = result.where("#{attribute} ilike :query", query: "%#{query}%")
    end
    result
  end
end