class JobApplicationMailer < ApplicationMailer

    def new_job_application_mail(job_application)
        @job_application = job_application

        mail(to: @job_application.professional.email, bcc:@job_application.user.email, subject: "Nueva solicitud de cliente")
    end

    def accepted_client(job_application)
        @job_application = job_application

        mail(to: @job_application.user.email, bcc:@job_application.professional.email, subject: "Solicitud de trabajo aceptada")
    end
    
    
end
