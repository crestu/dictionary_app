namespace :db do
    desc 'Add list to the list table'
    task add_list: :environment do
      # Define list name
      list_names = %w[Favorite Study]

      user = User.pluck(:id)
  
      list_names.each do |name|
        List.find_or_create_by(list_name: name, user_id: 1)
        puts "List '#{name}' added."
      end
  
      puts 'List added succesfully'
    end
  end