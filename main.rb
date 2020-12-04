require './entities/searchable_entity.rb'
require './entities/user.rb'
require './entities/organization.rb'
require './entities/ticket.rb'
require './menu.rb'
require 'pp'
require 'json'
SEARCHABLE_ENTITIES = %w(User Organization Ticket)
Menu.new.display_options
