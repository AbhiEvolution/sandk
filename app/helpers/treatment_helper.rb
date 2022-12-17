# require "active_support"
module TreatmentHelper
    def edit_method(patient,treatment)
        ed = ActiveSupport::SafeBuffer.new
        content_tag(:span ) do
            # name =patient.name
            ed << content_tag(:i,nil, class:'fa fa-user')
            # ed << patient.name
        end
        ed
    end
end
