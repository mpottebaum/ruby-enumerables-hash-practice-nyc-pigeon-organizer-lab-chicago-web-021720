def list_hash_with_name_keys(data_hash)
  names_list = []
  
  #adds each name array to running list
  data_hash.each_pair do |attribute, attribute_value|
    data_hash[attribute].each_pair {|k, v| names_list << v}
  end
  
  #flatten name array and remove duplicates
  flat_list = names_list.flatten
  unique_list = flat_list.uniq
  
  #creates new hash with name keys, values are hashes with attribute keys
  #attribute keys' values are empty arrays
  pigeon_list = {}
  unique_list.map {|name| pigeon_list[name] = {
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
  pigeon_list = list_hash_with_name_keys(data)
  
  pigeon_list.each_pair do |name, attribute|
    data.each_pair {|att, val| pigeon_list[name][attribute][val] = create_attribute_array(name, val)}
  end
  data.each_pair do |k, v|
    create_attribute_array
  end
  
  pigeon_list
end