class Admin::AdminsController < ApplicationController
	before_action :authenticate_admin!

  def top
    @count = Order.where(created_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day).count
  end

  def show

  end

end
