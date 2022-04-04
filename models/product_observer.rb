class ProductObserver < ActiveRecord::Observer
  observe :product

  def before_save(model)
      if model.level_of_stock < 5
          puts "Product #{model.name}'s quantity is bellow 5"
      end
  end
end