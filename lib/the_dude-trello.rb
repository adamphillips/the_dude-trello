require 'the_dude'
require 'trello'

require 'the_dude-trello/command'

Trello.configure do |config|
  config.developer_public_key = ENV['TRELLO_DEVELOPER_PUBLIC_KEY']
  config.member_token = ENV['TRELLO_MEMBER_TOKEN']
end

TheDude::Variable.new(:trello_board_id, /\S+/).register

TheDudeTrello::Command.new 'list trello boards' do
  boards = Trello::Board.all;

  boards.each do |board|
    say "\n\n#{board.name}"
    lists = board.lists.map!{|b| {title: b.name} }
    if lists.any?
      say Hirb::Helpers::Table.render(lists)
    else
      say '[ Sweet, nothing to worry about there ]'
    end
  end

  ''
end

TheDudeTrello::Command.new /list trello cards on board :trello_board_id/ do |board_id|
  board = Trello::Board.find(board_id);

  board.lists.each do |list|
    say "\n\n#{list.name}"
    cards = list.cards.map!{|c| {title: c.name} }
    if cards.any?
      say Hirb::Helpers::Table.render(cards)
    else
      say '[ Sweet, nothing to worry about there ]'
    end
  end

  ''
end

TheDude::Command.new /find (\S+) on trello board :trello_board_id/ do |card_title, board_id|
  extend Hirb::Console
  card_regex = Regexp.new(Regexp.quote(card_title), Regexp::IGNORECASE)
  say 'Just having a look'
  board = Trello::Board.find(board_id);
  anything_found = false

  board.lists.each do |list|
    cards = list.cards.map!{|c| {title: c.name, url: c.url} }.select{|c| c[:title].match card_regex}
    if cards.any?
      anything_found = true
      say "\n\n#{list.name}"
      card_index = menu(cards, :fields => [:title])
      card_index.each do |ci|
        `open #{ci[:url]}`
      end
    end
  end

  puts "Nah, nothing for #{card_title}" unless anything_found
  ''
end

