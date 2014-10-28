RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.disable_monkey_patching!
  config.warnings = true

  # This works
  config.before(:each) do
    RSpec::Mocks.with_temporary_scope do
      allow(Foo).to receive(:bar).and_return("quux")

      # Some stuff where we want to Foo.bar to be stubbed
    end
  end

  # FIXME: This does not
  config.before(:suite) do
    RSpec::Mocks.with_temporary_scope do
      allow(Foo).to receive(:bar).and_return("quux")

      # Some stuff where we want to Foo.bar to be stubbed
    end
  end
end
