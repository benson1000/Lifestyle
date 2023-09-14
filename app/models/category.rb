class Category < ApplicationRecord

  validates :name, presence:true, uniqueness: true, length: { minimum: 3, maximum: 30, too_long: '30 characters is the maximum allowed' }

  after_initialize :init #This callback will automatically call the init method after a new instance of the model class is initialized. In other words, when a new Category object is created, the init method will be automatically executed.

  #The purpose of this method is to initialize the priority attribute of a Category object if it's not already set. It does this by checking if there are any existing categories and sets the priority to one higher than the maximum priority among existing categories or 1 if there are no existing categories
  def init
    self.priority ||= Category.maximum('priority').nil? ? 1 : Category.maximum('priority') + 1
  end

  def self.prioritize(votes_by_category)
    categories = votes_by_category.keys
    categories.each_with_index do |category, i|
      find(category).update(priority: i + 1)
    end
    all
  end

end
