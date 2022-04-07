class Store < ActiveRecord::Base
  has_many :employees
  validates :name, length: {minimum: 3}
  validates :annual_revenue, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0}
  validate :apparel_validation

  def apparel_validation
    if mens_apparel.blank? && womens_apparel.blank?
      errors.add(:mens_apparel, "can't be blank")
      errors.add(:womens_apparel, "can't be blank")
    end
  end

end

# Stores must always have a name that is a minimum of 3 characters
# Stores have an annual_revenue that is a number (integer) that must be 0 or more
# BONUS: Stores must carry at least one of the men's or women's apparel (hint: use a custom validation method - don't use a Validator class)