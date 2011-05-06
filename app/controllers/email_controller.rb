class EmailController < ApplicationController
  skip_before_filter :verify_authenticity_token
  require 'mail'

  def input
    message = Mail.new params[:message]



    from = message.from[0]
    from_user = User.find_or_create_by_email(from) # TODO: grab name from email

    toandcc = message.to + message.cc # - ['ce1c14b80ca625c3078c@cloudmailin.net']
    toandcc_users = toandcc.map{|address|
      User.find_or_create_by_email(address) # TODO: grab name
    }
    Content.create(:by_user => from_user, :about_users => toandcc_users, :subject => message.subject, :body => message.body)

 #     message.attachments.each {|att|
 #       content.attachments << Attachment.new(:filename => att.original_filename, :bits => att.body, :content_type => att.content_type)
 #     }
  end
end
m

