class ConsultingController < InheritedResources::Base
  respond_to :html
  actions :index, :show
end
