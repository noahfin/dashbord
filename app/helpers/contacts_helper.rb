module ContactsHelper
  def user_reltionships(contact)

    err = ''
    group_id = params['contact'][:group_id] if params['contact'][:group_id]
    if group_id[1].to_i > 0 || group_id[0] != ''


     contact.group_ids = params['contact'][:group_id]
       end

     if params['contact']['user_id']

      users = params['contact']['user_id'].to_a

    users.each do |user|
      next if user == "" ||  user.to_i < 1
      user = User.find(user.to_i)

         contact_model = ContactsUser.create(contact: contact, user: user) unless ContactsUser.where(contact: contact, user: user).exists?


           end
         end

      end
     end



