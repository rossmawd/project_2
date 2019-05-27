class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true   # QU: what does this line do? Why don't models just directly inherit from AR:Base?
end
