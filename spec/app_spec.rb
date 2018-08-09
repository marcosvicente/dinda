#!/usr/bin/env ruby

require "spec_helper"
require_relative '../lib/app'

describe "get data from github api" do
  it "response can not be nil" do
    get_data_api
    expect(@response).to_not be_nil
  end
end
