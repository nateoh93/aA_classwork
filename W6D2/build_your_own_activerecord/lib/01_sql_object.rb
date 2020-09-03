require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns
    columns = DBConnection.execute2(<<-SQL).first
      SELECT
        *
      FROM
        #{self.table_name}
    SQL
    @columns = columns.map { |column_name, column_val| column_name.to_sym}
  end

  def self.finalize!
    self.columns.each do |name|
      define_method(name) do
        self.attributes[name]
      end
      
      setter_symbol = (name.to_s + '=')
      define_method(setter_symbol) do |new_value|
        self.attributes[name] = new_value
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end
  
  def self.table_name
    @table_name || self.name.underscore.pluralize
  end

  def attributes
    # ...
    @attributes ||= {}
  end
  
  def self.all
    # ...
  end
  
  def self.parse_all(results)
    # ...
  end
  
  def self.find(id)
    # ...
  end
  
  def initialize(params = {})
    # ...
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
