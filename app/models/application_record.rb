class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def purge_all_attachments
    self.attachements.purge
  end
end
