class UsersController < ApplicationController
	def index
		@users = User.all

	end

	def new
		@user = User.new
		
	end

	def create
       @user = User.new(allowed_params)

       if @user.save 
       	redirect_to users_path
       else
       	  rendender 'new'
       	end
		
	end

	def show
		@user =User.find(params[:id])
		
	end
	def edit
		@user =User.find(params[:id])
		
	end

	def update
		@user =User.find(params[:id])
		if @user.update_attributes(allowed_params)
       	redirect_to users_path
       else
       	  rendender 'edit'
       	end
	

		
	end
	def destroy
		@user =User.find(params[:id])
		@user.destroy
		redirect_to users_path
		
	end

	def complete 

		#User.where(:id => params[:mark_ids]).destroy_all
		#respond_to do |format|
		#	format.html{redirect_to users_path}
		#	format.js
		#end
		
		

		#redirect_to users_path
	end 

 	def destroy_multiple

     User.destroy(params[:users])

     respond_to do |format|
     format.html { redirect_to users_path }
     format.json { head :no_content }
     end

  

     end

	private
	def allowed_params
		params.require(:user).permit(:name,:age,:image)
	end


end
