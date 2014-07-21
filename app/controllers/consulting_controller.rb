class ConsultingController < InheritedResources::Base
  respond_to :html
  actions :index, :show

  def index
    @consulting = Consulting.first
    redirect_to @consulting unless @consulting.nil?
  end

  def show
    @consulting = Consulting.find params[:id]
    @consulting_next = @consulting.next_record || Consulting.first
  end

end
