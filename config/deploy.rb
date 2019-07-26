# config valid for current version and patch releases of Capistrano
lock '3.11.0'

set :application, 'rails-api-sample'
set :repo_url,  'git@github.com:kykt35/rails-api-sample.git'

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')
set :linked_files, %w{config/master.key}

set :rbenv_type, :user
set :rbenv_ruby, '2.6.1'

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }
set :keep_releases, 5

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end
