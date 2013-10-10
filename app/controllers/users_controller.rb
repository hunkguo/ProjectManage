class UsersController < ApplicationController
	layout 'main'
  def new
  	@user = User.new
  end

  def index
    @users = User.includes(:depts).all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.includes(:depts).find(params[:id])
  end

  def create_user
    @user = User.new(params[:user].permit(:username, :password, :password_confirmation,:last_login_time=>Time.now,:last_login_ip=>request.remote_ip  ,:login_count=>1))

    @dept = Dept.find(params[:user][:dept_ids])
    if @user.save
      if UserDept.create( :user => @user, :dept => @dept )
        redirect_to @user
      else
        render 'new'
      end
    end
  end
  def update
    @user = User.find(params[:id])
    if @user.update(params[:user].permit(:username, :password, :password_confirmation,:last_login_time=>Time.now,:last_login_ip=>request.remote_ip  ,:login_count=>1))
      
      #保存部门
      if !params[:user][:dept_ids].blank?
        depts = Array.new
        params[:user][:dept_ids].each{ |dept|
          depts << Dept.find(dept) unless dept.empty?
        }
        @user.depts=depts
      end
      
      #保存角色
      if !params[:user][:role_ids].blank?
        roles = Array.new
        params[:user][:role_ids].each{ |role|
          roles << Role.find(role) unless role.empty?
        }
        @user.roles=roles
      end


      redirect_to users_path
    end

  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end 
end
