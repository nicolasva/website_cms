require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe ContentsController do

  # This should return the minimal set of attributes required to create a valid
  # Content. As you add validations to Content, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "description" => "MyText" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ContentsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all contents as @contents" do
      content = Content.create! valid_attributes
      get :index, {}, valid_session
      assigns(:contents).should eq([content])
    end
  end

  describe "GET show" do
    it "assigns the requested content as @content" do
      content = Content.create! valid_attributes
      get :show, {:id => content.to_param}, valid_session
      assigns(:content).should eq(content)
    end
  end

  describe "GET new" do
    it "assigns a new content as @content" do
      get :new, {}, valid_session
      assigns(:content).should be_a_new(Content)
    end
  end

  describe "GET edit" do
    it "assigns the requested content as @content" do
      content = Content.create! valid_attributes
      get :edit, {:id => content.to_param}, valid_session
      assigns(:content).should eq(content)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Content" do
        expect {
          post :create, {:content => valid_attributes}, valid_session
        }.to change(Content, :count).by(1)
      end

      it "assigns a newly created content as @content" do
        post :create, {:content => valid_attributes}, valid_session
        assigns(:content).should be_a(Content)
        assigns(:content).should be_persisted
      end

      it "redirects to the created content" do
        post :create, {:content => valid_attributes}, valid_session
        response.should redirect_to(Content.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved content as @content" do
        # Trigger the behavior that occurs when invalid params are submitted
        Content.any_instance.stub(:save).and_return(false)
        post :create, {:content => { "description" => "invalid value" }}, valid_session
        assigns(:content).should be_a_new(Content)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Content.any_instance.stub(:save).and_return(false)
        post :create, {:content => { "description" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested content" do
        content = Content.create! valid_attributes
        # Assuming there are no other contents in the database, this
        # specifies that the Content created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Content.any_instance.should_receive(:update).with({ "description" => "MyText" })
        put :update, {:id => content.to_param, :content => { "description" => "MyText" }}, valid_session
      end

      it "assigns the requested content as @content" do
        content = Content.create! valid_attributes
        put :update, {:id => content.to_param, :content => valid_attributes}, valid_session
        assigns(:content).should eq(content)
      end

      it "redirects to the content" do
        content = Content.create! valid_attributes
        put :update, {:id => content.to_param, :content => valid_attributes}, valid_session
        response.should redirect_to(content)
      end
    end

    describe "with invalid params" do
      it "assigns the content as @content" do
        content = Content.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Content.any_instance.stub(:save).and_return(false)
        put :update, {:id => content.to_param, :content => { "description" => "invalid value" }}, valid_session
        assigns(:content).should eq(content)
      end

      it "re-renders the 'edit' template" do
        content = Content.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Content.any_instance.stub(:save).and_return(false)
        put :update, {:id => content.to_param, :content => { "description" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested content" do
      content = Content.create! valid_attributes
      expect {
        delete :destroy, {:id => content.to_param}, valid_session
      }.to change(Content, :count).by(-1)
    end

    it "redirects to the contents list" do
      content = Content.create! valid_attributes
      delete :destroy, {:id => content.to_param}, valid_session
      response.should redirect_to(contents_url)
    end
  end

end
