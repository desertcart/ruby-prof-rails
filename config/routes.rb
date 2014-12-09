RubyProf::Rails::Engine.routes.draw do

  namespace :ruby_prof, path: 'ruby_prof_rails' do
    namespace :rails, path: '' do
      post '' => 'home#update'
      resources :home, path: ''
      resources :profile
      resources :printer
    end
  end

end
