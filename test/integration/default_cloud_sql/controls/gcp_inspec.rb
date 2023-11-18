# Chef InSpec
# https://www.chef.io/inspec

# Since this is the default test, we want to test as much as possible here and not be redundant in
# the other tests.

project_id = input('project_id')
sql_instance = input('sql_instance')

control 'database_instance' do
  title 'Database Instance'

  # Database Instance
  # https://docs.chef.io/inspec/resources/google_sql_database_instance

  describe google_sql_database_instance(project: project_id, instance: sql_instance) do
    it { should exist }
    its('database_version') { should eq 'POSTGRES_15' }
    its('settings.availability_type') { should eq 'REGIONAL' }
    its('state') { should eq 'RUNNABLE' }
    its('region') { should eq 'us-east1' }

    # Define a desired_flags hash that contains the expected name and value pairs.

    desired_flags = {
      'cloudsql.enable_pgaudit' => 'on',
      'log_checkpoints' => 'on',
      'log_connections' => 'on',
      'log_disconnections' => 'on',
      'log_hostname' => 'on',
      'log_lock_waits' => 'on',
      'log_min_duration_statement' => '-1',
      'log_min_messages' => 'error',
      'log_statement' => 'ddl'
    }

    # Iterate through each pair using the desired_flags.each loop. Inside the loop, we use
    # subject.settings.database_flags.find to find the flag with a matching name. We verify
    # that the flag is not nil (indicating that it exists) and then check if its value matches
    # the expected value using expect(flag.value).to eq(value).

    desired_flags.each do |name, value|
      it "should have the '#{name}' flag with value '#{value}'" do
        flag = subject.settings.database_flags.find { |f| f.name == name }
        expect(flag).not_to be_nil
        expect(flag.value).to eq(value)
      end
    end
  end
end
