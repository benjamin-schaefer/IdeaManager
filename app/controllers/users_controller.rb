# -*- encoding : utf-8 -*-
class UsersController < ApplicationController#Devise::RegistrationsController
  load_and_authorize_resource

  def index
  end

  def show
  end

  def current_user_profile
    @current_user_profile ||= User.find(params[:id])
  end
  helper_method :current_user_profile

  def user_profiles
    @user_profiles ||= User.all
  end
  helper_method :user_profiles


end