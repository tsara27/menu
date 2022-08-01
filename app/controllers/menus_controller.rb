# frozen_string_literal: true

class MenusController < ApplicationController
  def index
    @menus = MenuItem.all

    render json: @menus.as_json(only: [:id, :name, :stock])
  end
end
