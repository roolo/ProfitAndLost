set :stage,     :production
set :rails_env, 'production'
set :deploy_to, '/var/www/ProfitAndLost_com'

server 'REPLACE_ME',
       user: 'ProfitAndLost',
       roles: %w(web app db)
