module WaitForAjax
  def wait_for_ajax
    is_ready = false
    begin
      Timeout.timeout(Capybara.default_wait_time) do
        is_ready = finished_all_ajax_requests?
      end
    end until is_ready
  end

  def finished_all_ajax_requests?
    page.evaluate_script('jQuery.active').zero?
  end
end

RSpec.configure do |config|
  config.include WaitForAjax
end