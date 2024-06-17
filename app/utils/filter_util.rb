# Conveninence module that holds function to loop through a Hash of keys to filter
module FilterUtil
  ##
  # @param [ActiveRecord::Relation] collection - collection we want to pass a bunch of columns to filter
  # @param [Hash] filter_params - key value of column and filter value
  def self.where_equal(collection:, filter_params:)
    filter_params.each do |filter_param, filter_value|
      # - Hash is passed as an argument to :where
      collection = collection.public_send(:where, filter_param => filter_value) if filter_value.present?
    end

    collection
  end

  def self.where_like(collection:, filter_params:)
    filter_params.each do |filter_param, filter_value|
      # @type [String]
      # Example: 'sellers.code LIKE ?'
      sql        = ['lower(', collection.table_name, '.', filter_param, ') LIKE ?'].join
      collection = collection.public_send(:where, sql, "%#{filter_value.downcase}%") if filter_value.present?
    end

    collection
  end

  def self.where_equal_join(collection:, filter_params:, relation:, join_table_name:)
    collection = collection.joins(relation) unless relation.nil? && filter_params.empty?
    filter_params.each do |filter_param, filter_value|
      # Rocket notation to dynamically assign key to hash
      # - Hash is passed as an argument to :where
      if filter_value.present?
        collection = collection.public_send(:where,
                                            join_table_name => { filter_param => filter_value })
      end
    end

    collection
  end

  def self.where_like_join(collection:, filter_params:, relation:, join_table_name:)
    collection = collection.joins(relation) unless relation.nil? && filter_params.empty?
    filter_params.each do |filter_param, filter_value|
      # @type [String]
      # Example: 'sellers.code LIKE ?'
      sql        = ['lower(', join_table_name, '.', filter_param, ') LIKE ?'].join
      collection = collection.public_send(:where, sql, "%#{filter_value.downcase}%") if filter_value.present?
    end

    collection
  end
end
