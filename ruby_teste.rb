# yield if block_given?

def my_function(url)
  form = "\n<form action='#{url}' method='post'>\n"
  form += yield if block_given?
  form += "</form>\n"
  puts form
end


my_function "/series/create" do 
  "\n<label>Meu texto:</label>\n<input type='text' />\n"
end








# <%= form_with model: @user, url: user_create_path, method: :post do |form| %>
#   <%= form.label :type, "Eu sou:" %>
#   <%= form.select :type, options_for_select([['Estudante', 'Student'], ['Professor', 'Instructor']]), required: true %>

#   <%= form.label :name, "Nome:" %>
#   <%= form.text_field :name, required: true %>

#   <%= form.label :email, "Email:" %>
#   <%= form.email_field :email, required: true %>

#   <%= form.label :password, "Nova Senha:" %>
#   <%= form.password_field :password, required: true %>

#   <%= form.label :password_confirmation, "Confirmar Senha:" %>
#   <%= form.password_field :password_confirmation, required: true %>

#   <% if flash[:alert] %>
#       <div class="alert"><%= flash[:alert] %></div>
#   <% end %>

#   <%= submit_tag "Criar conta" %>
# <% end %>
