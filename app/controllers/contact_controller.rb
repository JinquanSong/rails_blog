class ContactController < ApplicationController
  def new
  end

  def create
    redirect_to :new_contact_path
  end

  def current_page
    'contact'
  end
end
