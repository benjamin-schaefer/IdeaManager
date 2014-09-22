# -*- encoding : utf-8 -*-
class UsersController < ApplicationController#Devise::RegistrationsController
  load_and_authorize_resource

  def index
  end

  def show
  end

  def destroy
    current_user_profile.destroy
    respond_to do |format|
      format.html { redirect_to ideas_url, notice: 'User was succesesfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def lock_user 
    current_user_profile.locked = true
    current_user_profile.save
    redirect_to user_path(current_user_profile)
  end

  def unlock_user
    current_user_profile.locked = false
    current_user_profile.save
    redirect_to user_path(current_user_profile)
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