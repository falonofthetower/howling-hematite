class Admin::GiftsController < AdminController
  def index
    @gifts = Giver.all
  end
end
