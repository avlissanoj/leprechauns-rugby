Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, path: 'usuario', path_names: { sign_in: 'entrar',
                                                    sign_out: 'sair',
                                                    password: 'senha',
                                                    confirmation: 'confirmacao',
                                                    registration: 'registro',
                                                    sign_up: 'cadastrar' }

  root to: 'pages#home'

  resources :users,
            path: 'atleta',
            path_names: { edit: 'alterar_dados' },
            only: [ :edit, :update, :show ]

  resources :pages do
    collection do
      get 'home'
    end
  end
end
