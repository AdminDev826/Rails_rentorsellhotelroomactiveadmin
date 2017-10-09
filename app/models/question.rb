class Question < ApplicationRecord

has_one :answer
accepts_nested_attributes_for :answer, allow_destroy: true

end
