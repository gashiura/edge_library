require 'date'

class Api::RentalsController < ApplicationController

  def index
    @rentals = RentalDecorator.decorate_collection(
      Rental.where(user_id: params[:user_id], return_date: nil)
    )
    render 'index', formats: 'json', handlers: 'jbuilder'
  end

  def show
    @rental = Rental.find(params[:id]).decorate
    render 'show', formats: 'json', handlers: 'jbuilder'
  end

  def return_book
    now = Date.today
    rental = Rental.find(params['id'])
    if rental&.update(
      status: '返却済',
      return_date: now,
      return_approver: params['return_approver'],
      updated_at: now
    )
      render json: {
        status: 'success',
        message: '書籍を返却しました。'
      }
    else
      render json: {
        status: 'error',
        message: "書籍返却でエラーが発生しました。\n再度やり直して下さい。"
      }
    end
  end

end
