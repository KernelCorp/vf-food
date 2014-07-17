class ConsultingController < InheritedResources::Base
  respond_to :html
  actions :index, :show

  def index
    @consulting = Consulting.first
    @consulting_next = @consulting.next_record
  end

  def show
    @consulting = Consulting.find params[:id]
    @consulting_next = @consulting.next_record
  end

end
