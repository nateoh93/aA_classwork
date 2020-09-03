class AttrAccessorObject
  def self.my_attr_accessor(*names)
    # ...
    names.each do |name|
      define_method(name) do
        self.instance_variable_get("@#{name}")
      end
      
      setter_symbol = (name.to_s + '=')
      define_method(setter_symbol) do |new_value|
        self.instance_variable_set("@#{name}", new_value)
      end
      
    end
  end
end
