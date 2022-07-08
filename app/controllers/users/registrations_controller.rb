class Users::RegistrationsController < Devise::RegistrationsController
	 before_action :authenticate_user!,  except: [:index , :show]
	def create 
		super
		@user = @user.add_role params[:user][:roles]
		
	end 
end
