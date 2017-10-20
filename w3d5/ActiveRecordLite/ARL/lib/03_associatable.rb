require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    table_name.singularize.capitalize.constantize
  end

  def table_name
    @class_name.to_s.underscore + "s"
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    @primary_key = :id
    foreign = name.to_s + "_id"
    @foreign_key = foreign.to_sym
    @class_name = name.to_s.singularize.capitalize

    options.each do |key, value|
      if key == :class_name
        @class_name = value.to_s.singularize.capitalize
      elsif key == :primary_key
        @primary_key = value.to_sym
      elsif key == :foreign_key
        @foreign_key = value.to_sym
      end
    end

  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    @primary_key = :id
    foreign = self_class_name.to_s.underscore + "_id"
    @foreign_key = foreign.to_sym
    @class_name = name.to_s.singularize.capitalize

    options.each do |key, value|
      if key == :class_name
        @class_name = value.to_s.singularize.capitalize
      elsif key == :primary_key
        @primary_key = value.to_sym
      elsif key == :foreign_key
        @foreign_key = value.to_sym
      end
    end

  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    options = BelongsToOptions.new(name, options)

    define_method(name) do
      foreign_key = options.send(:foreign_key)
      p foreign_key
      target_model_class = options.send(:model_class)
      target_model_class.where(options.primary_key => foreign_key).first
    end
  end

  def has_many(name, options = {})
    # ...
  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
  end
end

class SQLObject
  # Mixin Associatable here...
end
