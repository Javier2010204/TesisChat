class OrderMailer < ApplicationMailer

    def created_order(order)
        @order = order

        mail(from: @order.user.email, to: @order.receiver.email, bcc:@order.receiver.email, subject: "Nueva orden creada")
    end

    def accept_order(order)
        @order = order

        mail(from: @order.user.email, to: @order.receiver.email, bcc:@order.receiver.email, subject: "Solicitud de orden aceptada")
    end
    
    
end
