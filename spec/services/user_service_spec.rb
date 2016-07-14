require 'rails_helper'

RSpec.describe UserService do
  before do
    @current_user = User.from_omniauth({
         'uid'  => "14189706",
         'info' => {'name'     => "Lucy Fox",
                  'nickname' => "lucyfox4131",
                  'image'    => "https://avatars.githubusercontent.com/u/14189706?v=3"},
         'credentials' => {
                  'token' => ENV["TOKEN"]}})
  end

  context "#user information" do
    it 'returns a list of followers' do
      VCR.use_cassette("followers") do
        followers = UserService.new(@current_user).followers
        follower = followers.first

        expect(followers.count).to eq(6)
        expect(follower['login']).to eq("mikedao")
      end
    end

    it 'returns a list of following' do
      VCR.use_cassette("following") do
        following = UserService.new(@current_user).following
        person = following.first

        expect(following.count).to eq(4)
        expect(person['login']).to eq("icorson3")
      end
    end

    it 'returns a list of starred repos' do
      VCR.use_cassette("starred") do

        stars = UserService.new(@current_user).starred
        star = stars.first

        expect(stars.count).to eq(2)
        expect(star['name']).to eq("APICurious")
      end
    end

    it 'returns a list of repos' do
      VCR.use_cassette("repos") do
        repos = UserService.new(@current_user).repositories
        repo = repos.first
        expect(repos.count).to eq(30)
        expect(repo['name']).to eq("black_thursday")
      end
    end

    it 'returns a list of recent personal events' do
      VCR.use_cassette("personal_events") do
        events = UserService.new(@current_user).push_events
        event = events.first
        expect(event['actor']['login']).to eq("lucyfox4131")
      end
    end

    it 'returns a list of other user events' do
      VCR.use_cassette("other_user_events") do
        events = UserService.new(@current_user).other_user_events('icorson3')
        event = events.first
        expect(event['actor']['login']).to eq("icorson3")
      end
    end

    it 'returns a list of orgs' do
      VCR.use_cassette("orgs") do
        orgs = UserService.new(@current_user).orgs
        org = orgs.first
        expect(orgs.count).to eq(1)
        expect(org['login']).to eq("Projectapicurious")
      end
    end
  end
end
