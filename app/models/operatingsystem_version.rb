class OperatingsystemVersion < ApplicationRecord
has_many :product_operatingsystems
has_many :os_versions
has_many :operatingsystems
end
