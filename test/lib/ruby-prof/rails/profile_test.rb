require 'test_helper'
require_relative 'profiles_mock_module'

describe RubyProf::Rails::Profile do
  include RubyProf::Rails::ProfilesMockModule

  before do
    @filename = create_random_profile(1).first
    @profile = RubyProf::Rails::Profile.new(@filename)
  end

  after do
    cleanup_profiles
  end

  describe 'Profile is correct class' do
    it 'returns and array or profile objects' do
      @profile.must_be_instance_of RubyProf::Rails::Profile
    end
  end

  describe 'profile' do
    it 'has properties' do
      @profile.basename.present?.must_equal true
      @profile.filename.must_equal @filename
      @profile.friendly_filename.present?.must_equal true
      @profile.id.present?.must_equal true
      @profile.time.present?.must_equal true
      @profile.exists?.must_equal true
      @profile.hash.must_be_instance_of Hash
      @profile.hash[:prefix].must_equal RubyProf::Rails::Profile::PREFIX
    end
  end
end
