module OmniauthMod
  def mock_omniauth
    OmniAuth.config.mock_auth[:github] = {
      'provider' => 'github',
      'uid' => '123545',
      'user_info' => {
        'name' => 'mockuser',
        'image' => 'mock_user_thumbnail_url'
      },
      'credentials' => {
        'token' => 'mock_token',
      }
    }
  end
end
