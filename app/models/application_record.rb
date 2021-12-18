class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def purge_all_attachments
    self.attachments.purge
  end
end
