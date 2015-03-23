module Searchable
  def where_ilike search_hash
    attribute = search_hash.keys.first
    query = search_hash[attribute]
    where("#{attribute} ilike :query", query: "%#{query}%")
  end
end