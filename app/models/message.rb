class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  validates_presence_of :body, :conversation_id, :user_id

  
  #==================================
  #  display the time of the message
  #  in a more human readable way:
  #==================================
    def message_time
      created_at.strftime("%d/%m/%y at %l:%M %p")
    end

    
end
