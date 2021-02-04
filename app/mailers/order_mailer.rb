class OrderMailer < ApplicationMailer

    def created_order(order)
        @order = order

        mail(to: @order.user.email, bcc:@order.receiver.email, subject: "Nueva orden creada")
    end
    
end
