require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    where_line = params.keys.map { |key| "#{key} = ?" }.join(' AND ')
    values = params.values
    # p values
    # p where_line

    results = DBConnection.execute(<<-SQL, *values)
      SELECT
        *
      FROM
        #{table_name}
      WHERE
        #{where_line}
    SQL

    results.map do |result|
      self.new(result)
    end
  end
end

class SQLObject
  extend Searchable
  #include makes pass-in methods from Module become INSTANCE methods
  #extend makes ppass-in methods from Module become CLASS methods
end
