set :stage,     :staging
set :deploy_to, '/var/www/ProfitAndLost_webapps_cz'
set :rails_env, 'staging'

server 'REPLACE_ME',
        user: 'ProfitAndLost_webapps_cz',
        roles: %w(web app db)

