require "active_record/column_where_chain/version"
module ActiveRecord
  class ColumnWhereChain

    def initialize(scope, column)
      @scope = scope
      @column = @scope.arel_table[column]
    end

    def like(value)
      @scope.where(@column.matches(value))
    end

    module QueryMethods

      def where(opts = :chain, *rest)
        if opts == :chain
          WhereChain.new(spawn)
        elsif opts.is_a?(Symbol) && rest.empty?
          ColumnWhereChain.new(spawn, opts)
        elsif opts.blank?
          self
        else
          spawn.where!(opts, *rest)
        end
      end
    end
    ::ActiveRecord::Relation.send :include, ActiveRecord::ColumnWhereChain::QueryMethods
  end
end
