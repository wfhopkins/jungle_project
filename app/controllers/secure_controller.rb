class Security::SecureController < ApplicationController
  before_filter :authorize
end