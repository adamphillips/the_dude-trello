module TheDudeTrello
  class Command < TheDude::Command
    # Checks that the necessary Trello configuration variables are set before
    # trying a request
    def ask *args
      begin
        raise 'You need to tell me your trello details' unless Trello.configuration.developer_public_key && Trello.configuration.member_token
        super *args
      rescue Exception => e
        TheDude.complain e.message
      end
    end
  end
end
