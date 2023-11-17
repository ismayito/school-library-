#!/usr/bin/env ruby

require './app'

def main
  app = App.new
  app.run
  app.options_list
  app.choose_option
end

main
