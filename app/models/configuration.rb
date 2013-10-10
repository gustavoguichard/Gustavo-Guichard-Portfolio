class Configuration < ActiveRecord::Base
  attr_accessible :name, :value

  # Canot use schema_validations for we need to use this model before the schema* gems are loaded
  validates_presence_of :name
  validates_uniqueness_of :name

  class << self
    # This method returns the values of the config simulating a Hash, like:
    #   Configuration[:foo]
    # It can also bring Arrays of keys, like:
    #   Configuration[:foo, :bar]
    # ... so you can pass it to a method using *.
    # It is memoized, so it will be correctly cached.
    def [] *keys
      if keys.size == 1
        get keys.shift
      else
        keys.map{|key| get key }
      end
    end

    def []= key, value
      set key, value
    end

    private

    def get key
      find_by_name(key).value rescue nil
    end

    def set key, value
      begin
        find_by_name(key).update_attribute :value, value
      rescue
        create!(name: key, value: value)
      end
      value
    end

  end
end