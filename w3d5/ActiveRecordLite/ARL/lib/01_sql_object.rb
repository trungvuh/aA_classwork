require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns unless @columns.nil?

    @columns = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
    SQL
    .first.map { |column| column.to_sym }
  end

  def self.finalize!
    columns.each do |column|
      define_method(column) do
        self.attributes[column]
      end

      define_method("#{column}=") do |value|
        self.attributes[column] = value
      end
    end

  end

  def self.table_name=(table_name)
    table_name
  end

  def self.table_name
    name = self.to_s.downcase
    "#{name}s"
  end

  def self.all
    results = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
    SQL

    self.parse_all(results)
  end

  def self.parse_all(results)
    objects = []

    results.each do |result|
      object = self.new(result)
      # result.each do |attr_name, value|
      #   object.send("#{attr_name}=", value)
      # end
      objects << object
    end

    objects
  end

  def self.find(id)
    result = DBConnection.execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{table_name}
      WHERE
        id = ?
    SQL

    self.new(result.first) unless result.empty?
  end

  def initialize(params = {})
    params.each do |attr_name, value|
      attr_name = attr_name.to_sym

      if self.class.columns.include?(attr_name)
        self.send("#{attr_name}=", value)
      else
        raise "unknown attribute '#{attr_name}'"
      end
      # self.send()
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    values = []
    @attributes.each_value do |value|
      values << value
    end
    values
  end

  def insert
    cols = self.class.columns[1..-1]
    col_names = cols.join(', ')
    question_marks = (["?"] * cols.length).join(', ')

    values = self.attribute_values

    DBConnection.execute(<<-SQL, *values)
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{question_marks})
    SQL

    self.id = DBConnection.last_insert_row_id

  end

  def update
    
  end

  def save
    # ...
  end
end
