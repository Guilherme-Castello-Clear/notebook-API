module V1
  class ContactsController < ApplicationController
    include ErrorSerializer
    before_action :set_contact, only: [:show, :update, :destroy]

    # GET /contacts
    def index

      @contacts = Contact.all.page(params[:page].try(:[], :number))
      
      
      expires_in 30.seconds, public: true
      render json: @contacts #, methods: [:birthdate_br]
      #paginate json: @contacts #, methods: [:birthdate_br]
    end

    # GET /contacts/1
    def show
      render json: @contact #, include: [:kind, :address, :phones] #, include: [:kind, :phones, :address]
    end

    # POST /contacts
    def create
      @contact = Contact.new(contact_params)

      if @contact.save
        render json: @contact, include: [:kind, :phones, :address], status: :created, location: @contact
      else
        render json: ErrorSerializer.serialize(@contact.errors) #@contact.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /contacts/1
    def update
      if @contact.update(contact_params)
        render json: @contact, include: [:kind, :phones, :address]
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
        ActiveModelSerializers::Deserialization.jsonapi_parse(params)
        #params.require(:contact).permit(:name, :email, :birthdate, :kind, :kind_id, phones_attributes: [:id, :number, :_destroy], address_attributes: [:id, :street, :city])
      end
  end
end