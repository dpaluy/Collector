require 'spec_helper'

describe VolatilitiesController do

  # This should return the minimal set of attributes required to create a valid
  # Volatility. As you add validations to Volatility, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {:name => "VIX"}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # VolatilitiesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all volatilities as @volatilities" do
      volatility = Volatility.create! valid_attributes
      get :index, {}, valid_session
      assigns(:volatilities).should eq([volatility])
    end
  end

  describe "GET show" do
    it "assigns the requested volatility as @volatility" do
      volatility = Volatility.create! valid_attributes
      get :show, {:id => volatility.to_param}, valid_session
      assigns(:volatility).should eq(volatility)
    end
  end

  describe "GET new" do
    it "assigns a new volatility as @volatility" do
      get :new, {}, valid_session
      assigns(:volatility).should be_a_new(Volatility)
    end
  end

  describe "GET edit" do
    it "assigns the requested volatility as @volatility" do
      volatility = Volatility.create! valid_attributes
      get :edit, {:id => volatility.to_param}, valid_session
      assigns(:volatility).should eq(volatility)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Volatility" do
        expect {
          post :create, {:volatility => valid_attributes}, valid_session
        }.to change(Volatility, :count).by(1)
      end

      it "assigns a newly created volatility as @volatility" do
        post :create, {:volatility => valid_attributes}, valid_session
        assigns(:volatility).should be_a(Volatility)
        assigns(:volatility).should be_persisted
      end

      it "redirects to the created volatility" do
        post :create, {:volatility => valid_attributes}, valid_session
        response.should redirect_to(Volatility.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved volatility as @volatility" do
        # Trigger the behavior that occurs when invalid params are submitted
        Volatility.any_instance.stub(:save).and_return(false)
        post :create, {:volatility => {}}, valid_session
        assigns(:volatility).should be_a_new(Volatility)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Volatility.any_instance.stub(:save).and_return(false)
        post :create, {:volatility => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested volatility" do
        volatility = Volatility.create! valid_attributes
        # Assuming there are no other volatilities in the database, this
        # specifies that the Volatility created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Volatility.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => volatility.to_param, :volatility => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested volatility as @volatility" do
        volatility = Volatility.create! valid_attributes
        put :update, {:id => volatility.to_param, :volatility => valid_attributes}, valid_session
        assigns(:volatility).should eq(volatility)
      end

      it "redirects to the volatility" do
        volatility = Volatility.create! valid_attributes
        put :update, {:id => volatility.to_param, :volatility => valid_attributes}, valid_session
        response.should redirect_to(volatility)
      end
    end

    describe "with invalid params" do
      it "assigns the volatility as @volatility" do
        volatility = Volatility.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Volatility.any_instance.stub(:save).and_return(false)
        put :update, {:id => volatility.to_param, :volatility => {}}, valid_session
        assigns(:volatility).should eq(volatility)
      end

      it "re-renders the 'edit' template" do
        volatility = Volatility.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Volatility.any_instance.stub(:save).and_return(false)
        put :update, {:id => volatility.to_param, :volatility => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested volatility" do
      volatility = Volatility.create! valid_attributes
      expect {
        delete :destroy, {:id => volatility.to_param}, valid_session
      }.to change(Volatility, :count).by(-1)
    end

    it "redirects to the volatilities list" do
      volatility = Volatility.create! valid_attributes
      delete :destroy, {:id => volatility.to_param}, valid_session
      response.should redirect_to(volatilities_url)
    end
  end

end
