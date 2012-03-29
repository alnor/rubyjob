require 'test_helper'

class WorkerTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "should not save the worker whithout name" do
    worker = Worker.new
    assert !worker.save, "Saved the vacancy whithout name"
  end
  
  test "should not save the worker if contacts not exists email or phone" do
    worker = Worker.new
    assert !worker.save, "Saved the worker if contacts not exists email or phone"
  end
end
