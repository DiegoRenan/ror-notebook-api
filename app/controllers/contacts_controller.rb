class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :update, :destroy]

  # GET /contacts
  def index
    @contacts = Contact.all

    #render para actions individual. Metodos no controller
    #render json: @contacts.map { |contact| contact.attributes.merge({author: "Jackson"})}

    #render para actions individual. Metodo chamado no model
    #render json: @contacts, methods: :author

    #render sobreescrevendo o as_json. Aplicado para todas actions
    #render json: @contacts, methods: [:hello, :i18n]

    #render json: @contacts, methods: :birthdate_br

    render json: @contacts
  end

  # GET /contacts/1
  def show
    render json: @contact.to_br
  end

  # POST /contacts
  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render json: @contact, status: :created, location: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contacts/1
  def update
    if @contact.update(contact_params)
      render json: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def contact_params
      params.require(:contact).permit(:name, :email, :birthdate, :kind_id)
    end
end
