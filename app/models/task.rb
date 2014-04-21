class Task < ActiveRecord::Base
  attr_accessible :status, :title

  validates_presence_of :title
  validates_inclusion_of :status, in: %w[pending done]

  after_initialize :set_defaults

  scope :ordered_by_pending, -> {order("status desc")}

  def done?
    status == "done"
  end

  private
  def set_defaults
    self.status ||= "pending"
  end

end

