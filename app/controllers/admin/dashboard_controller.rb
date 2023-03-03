class Admin::DashboardController < Admin::AdminController
  def index
    @users = User.all
  end
end
