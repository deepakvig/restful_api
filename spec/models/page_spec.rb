require 'rails_helper'

RSpec.describe Page, type: :model do

  describe "Valid Attributes" do
    it { is_expected.to have_attribute :url }
    it { is_expected.to have_attribute :content }
  end

  describe "Validations" do
    it { should validate_presence_of(:url) }

    it "expects url is not valid nor accesible" do
      subject = Page.new(url: 'htttp://www.badurl.com')
      #subject.valid?
      # before line fails because spec for 'GET /v1/pages'
      # instead it is used next line
      subject.send(:valid_url?)
      expect(subject.errors[:url]).to include "is not valid"
    end
  end

  describe "Callbacks" do
    it "expects to set content attribute before save" do
      subject = Page.new(url: 'http://www.google.com')
      subject.save
      expect(subject.reload.content).not_to be_nil
    end
  end

end
