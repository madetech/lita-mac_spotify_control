module TestHelpers
  def capture_stdout(&block)
    original_stdout = $stdout
    $stdout = fake = StringIO.new
    begin
      yield
    ensure
      $stdout = original_stdout
    end
    fake.string
  end

  def expect_stdout(string, &block)
    output = capture_stdout(&block)
    expect(output).to include(string)
  end
end