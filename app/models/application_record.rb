class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def generate_slug
    self.slug = self.name.parameterize
  end

  def self.find_by_id_or_slug(param)
    #  Bang version of find_by returns 404 on failure
    self.find_by(id: param).present? ? self.find_by!(id: param) : self.find_by!(slug: param)
  end
end
