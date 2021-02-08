class ExtensionOrderMailer < ApplicationMailer
    def created_extension_order(extension_order)
        @extension_order = extension_order

        mail(from: @extension_order.user.email, to: @extension_order.receiver.email, bcc:@extension_order.receiver.email, subject: "Solicitud de prorroga")
    end

    def accepted_extension_order(extension_order)
        @extension_order = extension_order

        mail(from: @extension_order.user.email, to: @extension_order.receiver.email, bcc:@extension_order.receiver.email, subject: "Se acepto tu solicitud de prorroga")
    end
    
end
