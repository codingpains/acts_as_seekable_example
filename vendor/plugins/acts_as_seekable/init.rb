$:.unshift "#{File.dirname(__FILE__)}/lib"
require 'active_record/acts/seekable'
ActiveRecord::Base.class_eval { include ActiveRecord::Acts::Seekable }
