require "smtp"

client = SMTP::Client.new("localhost")

message = SMTP::Message.new()
message.from = SMTP::Address.new(email="info@hire.io", name="Test")
message.to << SMTP::Address.new(email="haffuza@gmail.com", name="Name")
message.subject = "Testing message"
message.body = %{
  <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
  <html xmlns="http://www.w3.org/1999/xhtml">
   <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Demystifying Email Design</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  </head>
  <body>Test <h1><strong>HTML</strong></h1></body>
  </html>
}

client.send message
