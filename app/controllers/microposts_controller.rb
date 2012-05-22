class MicropostsController < ApplicationController
  respond_to :html, :js
  def new
    @micropost = Micropost.new
    @user = User.find(params[:user_id])
    respond_to do |format|
      format.html
      format.xml { render json: @micropost }
    end
  end
  
  def create
    @user = User.find(params[:user_id])
    @micropost = @user.microposts.new(params[:micropost])
    respond_to do |format|
      if @micropost.save
        format.html { redirect_to(@user) }
        format.xml { render :xml => @user, :status => :created, :location => @user }
        format.js
      else
        format.html { redirect_to(@user) }
        format.xml { render :xml => @micropost.errors }
        format.js
      end
    end
  end
  
  def edit
    @user = User.find(params[:id])
    if current_user
      if current_user == @user
        current_user
      end
    else
      redirect_to @user, :notice => "You cannot edit another user's post"
    end

    @micropost = @user.microposts.find(params[:user_id])  
  end
  
  def destroy
    @user = User.find(params[:id])
    @micropost = Micropost.find(params[:user_id])
    @micropost.destroy
    respond_to do |format|
      format.html { redirect_to(@user) }  
      format.js
    end
  end
end
