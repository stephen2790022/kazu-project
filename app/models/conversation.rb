class Conversation < ApplicationRecord
	belongs_to :sender, class_name: "User", foreign_key: "sender_id"
	belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"
	belongs_to :library_item
	has_many :messages, dependent: :destroy

	validates_uniqueness_of :sender_id, scope: :receiver_id

	#==============================================================================
	#	method between which will allow us to find the conversation "between" to users, 
	# 	regardless of who is the sender and who is the receiver.
	# 	To create a class method with ActiveRecord, we use the scope method, like so:
	#===============================================================================
	scope :between, -> (sender_id,receiver_id) do
    where("(conversations.sender_id = ? AND conversations.receiver_id = ?) OR (conversations.receiver_id = ? AND conversations.sender_id = ?)", sender_id, receiver_id, sender_id, receiver_id)
	end

	#===============================================================================
	# leaving our views and controllers as clean as possible. 
	# We can remove the receiver variable from the conversations index page and move 
	# the logic into the model:
	#================================================================================
	def recipient(current_user)
    	self.sender_id == current_user.id ? self.receiver : self.sender
  	end
	
	#=========================================================
	# display the number of unread messages in a conversation
	#=========================================================
	def unread_message_count(current_user)
    	self.messages.where("user_id != ? AND read = ?", current_user.id, false).count
  	end
end
