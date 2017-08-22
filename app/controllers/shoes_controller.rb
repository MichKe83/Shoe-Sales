class ShoesController < ApplicationController


	def show
		@user = User.find(params[:id])
		@shoes = Shoe.all
		@transactions = Transaction.all

	
		return render 'index.html'
	end

	def buy
		@user = current_user
		shoe = Shoe.find(params[:id])
		transaction = Transaction.new(user: @user, shoe: shoe)
		
		if transaction.save

			return redirect_to "/dashboard"
		end
	
		return redirect_to :back
	end

	def create
		user = current_user
		shoe = Shoe.new(name: params[:name], amount: params[:amount], user: user)

		if shoe.save
			return redirect_to :back
		end

		flash[:errors] =  shoe.errors.full_messages
		return	redirect_to :back
	end


	def dashboard
		@user = current_user
		@shoes = Shoe.all

		@transactions = Transaction.all

		p @sum = @shoes.first.amount.to_i + @shoes.second.amount.to_i + @shoes.third.amount.to_i
		p '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'

		return render 'dashboard.html'
	end

	def destroy
		shoe = Shoe.find(params[:id])
		shoe.destroy
		
		return redirect_to '/dashboard'
	end

end
