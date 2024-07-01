### Accounts
account_firm = Account.find_or_create_by!(company_type: "accounting firm", name: "Firms R' Us", address: nil)
account_bookkeeper = Account.find_or_create_by!(company_type: "bookkeeper", name: "Totally Legitimate Bookkeeper - No Government Problems At All", address: "123 N Not a Scam, Pasadena CA, 91104")


# Users
user_firm = User.find_or_create_by!(name: "Ben Wyatt", account: account_firm)

user_bookie_1 = User.find_or_create_by!(name: "Eddie Felson", account: account_bookkeeper)
user_bookie_2 = User.find_or_create_by!(name: "Teddy KGB", account: account_bookkeeper)
user_bookie_3 = User.find_or_create_by!(name: "Jay Trotter", account: account_bookkeeper)
user_bookie_4 = User.find_or_create_by!(name: "Axel Freed", account: account_bookkeeper)


# Messages
message_1 = Message.new(user: user_bookie_1, message: "We've been discovered")
message_recipients = MessageRecipient.find_or_create_by!(user: user_bookie_2, message: message_1)
message_recipients = MessageRecipient.find_or_create_by!(user: user_bookie_3, message: message_1)
message_recipients = MessageRecipient.find_or_create_by!(user: user_bookie_4, message: message_1)

message_2 = Message.new(user: user_bookie_2, message: "Delete everything!")
message_recipients = MessageRecipient.find_or_create_by!(user: user_bookie_1, message: message_2)
message_recipients = MessageRecipient.find_or_create_by!(user: user_bookie_3, message: message_2)
message_recipients = MessageRecipient.find_or_create_by!(user: user_bookie_4, message: message_2)

message_3 = Message.new(user: user_bookie_3, message: "None of you are supposed to message ANY of this!!!1")
message_recipients = MessageRecipient.find_or_create_by!(user: user_bookie_2, message: message_3)
message_recipients = MessageRecipient.find_or_create_by!(user: user_bookie_1, message: message_3)
message_recipients = MessageRecipient.find_or_create_by!(user: user_bookie_4, message: message_3)