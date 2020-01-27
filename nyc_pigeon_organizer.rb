def unique_name_array(data_hash)
  names_list = []
  
  #adds each name array to running list
  data_hash.each_pair do |attribute, attribute_value|
    data_hash[attribute].each_pair {|k, v| names_list << v}
  end
  
  #flatten name array and remove duplicates
  flat_list = names_list.flatten
  unique_list = flat_list.uniq
  unique_list
end

def list_hash_with_name_keys(name_array)
  #creates new hash with name keys, values are hashes with attribute keys
  #attribute keys' values are empty arrays
  pigeon_list = {}
  name_array.map {|name| pigeon_list[name] = {
    :color => [],
    :gender => [],
    :lives => []
  }}
  pigeon_list
end

def create_attribute_array(name, attribute_hash)
  #given the name of pigeon and attribute hash, returns array of attribute values corresponding to name
  attribute_array = attribute_hash.reduce([]) do |memo, (k, v)|
    if v.include?(name)
      attribute_value = k.to_s
      memo << attribute_value
    end
    memo
  end
  attribute_array
end

def nyc_pigeon_organizer(data)
  name_array = unique_name_array(data)
  pigeon_list = list_hash_with_name_keys(name_array)
  
  name_array.map do |name|
    data.each_pair do |att, att_hash|
      att_array = create_attribute_array(name, att_hash)
      pigeon_list[name][att].concat(att_array)
    end
  end
  
  pigeon_list
end