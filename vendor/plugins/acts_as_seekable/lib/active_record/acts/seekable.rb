# ActsAsSeekable
module ActiveRecord
  module Acts
    module Seekable

      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods

        attr_accessor :config

        def acts_as_seekable(options = {})
          self.config = { :paginate => false }
          self.config.update(options) if options.is_a?(Hash)
          self.config[:paginate] = eval(config[:paginate].to_s) if config[:paginate].is_a?(Symbol)
          self.config[:paginate] = eval(config[:paginate]) if config[:paginate].is_a?(String)
          class_eval <<-EOV
            include ActiveRecord::Acts::Seekable::ClassMethods
            named_scope :all_records
            named_scope :ordered_by, lambda { |order| { :order => order }}
          EOV
        end

        def seek(params = {})
          to_eval = "#{name}.all_records" if !params[:filter]

          if scope = params[:filter]
            to_eval = "#{name}.#{params[:filter]}" if scopes.has_key?(scope.to_sym)
          end

          if !params[:search].blank? && scopes.has_key?(:search)
            to_eval << ".search('#{params[:search]}')"
          end

          to_eval << ".ordered_by('#{params[:order]}')" if params[:order]

          if eval("#{name}.method_defined?(:paginate)") && config[:paginate] == true
            to_eval << ".paginate(:page => params[:page],
              :per_page => params[:per_page] || 5)"
          end

          eval(to_eval)
        end

      end
    end
  end
end
