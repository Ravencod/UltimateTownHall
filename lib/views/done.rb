class Done
  attr_reader :msg_1_1, :msg_1_2, :msg_1_3, :msg_2_1, :msg_2_2,:msg_2_3, :msg_3_1, :msg_3_2, :msg_3_3, :msg_4_1, :msg_4_2, :msg_4_3
  def initialize
    @msg_1_1 = "> Now extracting contacts information from "
    @msg_1_2 = "\n>> All contact information are extracted\n> Now exporting data to json file"
    @msg_1_3 = "\n>> All Data exported to json file\n\n You can now proceed with step #2: send emails to all townhalls"
    @msg_2_1 = "> Now parsing the json file.."
    @msg_2_2 = ">> json file is parsed.\n\n> Now sending mails to :"
    @msg_2_3 = "\n>> All mails are sent !!!\n\n You can now proceed with step #3: Add the 'twitter handle' information in the db (json file)"
    @msg_3_1 = "> Now parsing the json file.."
    @msg_3_2 = ">> json file is parsed.\n\n> Now updating db (json) with twitter handles information.."
    @msg_3_3 = "\n>> All twitter handles are updated in db !!!\n\n You can now proceed with step #4: Follow the townhalls on twitter"
    @msg_4_1 = "> Now parsing the json file.."
    @msg_4_2 = ">> json file is parsed.\n\n> Now following townhalls on twitter.."
    @msg_4_3 = "\n>> All (available) twitter accounts are followed !!!\n\n You are done but you can trigger any step again if you want"
  end
end
