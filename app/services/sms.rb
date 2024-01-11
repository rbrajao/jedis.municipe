
class Sms
    def send_sms(to, body)
        client = Twilio::REST::Client.new(
        Rails.application.config.action_mailer.twilio_sms_settings[:account_sid],
        Rails.application.config.action_mailer.twilio_sms_settings[:auth_token]
        )
    
        client.messages.create(
        to: to,
        from: Rails.application.config.action_mailer.twilio_sms_settings[:from],
        body: body
        )
    end
end