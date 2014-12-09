class Municipio < ActiveRecord::Base
  has_many :dependencies

    has_many :ilines
end
