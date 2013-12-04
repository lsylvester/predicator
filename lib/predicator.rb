require "predicator/version"
module Predicator
  class ColumnWhereChain

    def initialize(scope, column)
      @scope = scope
      @column = @scope.arel_table[column]
    end

    def self.predicate name, &block
      define_method(name) do |*values|
        @scope.where(block.call(@column, *values))
      end
    end

    Arel::Predications.instance_methods.each do |method|
      predicate method do |column, value|
        column.send(method, value)
      end
    end

    module QueryMethods

      def where(opts = :chain, *rest)
        if opts == :chain
          WhereChain.new(spawn)
        elsif opts.is_a?(Symbol) && rest.empty?
          column_where_chain_class.new(spawn, opts)
        elsif opts.blank?
          self
        else
          spawn.where!(opts, *rest)
        end
      end
    end

    module Predicate
      def column_where_chain_class
        return ColumnWhereChain if self == ActiveRecord::Base
        @column_where_chain_class ||=  Class.new(superclass.column_where_chain_class)
      end

      delegate :predicate, to: :column_where_chain_class
    end
    ::ActiveRecord::Relation.send :include, QueryMethods
    ::ActiveRecord::Base.send :extend, Predicate
  end
end