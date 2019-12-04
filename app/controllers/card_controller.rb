class CardController < ApplicationController
  
  before_action :set_key,  except:  [:new]
  
  def new
    card = Card.where(user_id: current_user.id)
    redirect_to action: "show" if card.exists?
  end

  def pay
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        card: params['payjp-token'],
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to controller: 'signups' ,action: 'complete'
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete
    card = Card.where(user_id: customer_user.id).first
    if card.blank?
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.dalete
    end
      redirect_to action: "new"
  end

  def show
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_infomation = customer.cards.retrieve(card.card_id)
      
    end
  end

  private

  def set_key
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
  end

end
