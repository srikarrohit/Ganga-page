class SessionsController < ApplicationController

  require 'net/ldap'

  def new
  end

  def create

    username = params[:session][:roll]
    password = params[:session][:password]
    #    if username == password
    #      session[:user] = username.upcase
    #      user = User.find_by_username(session[:user])
    #      session[:user_id] = user.id
    #      
    #    else
    #      redirect_to new_user_session_path, :flash => {:error => "Invalid username or password"}
    #    end
    ldap = Net::LDAP.new :host => "ldap.iitm.ac.in",
      :port => 389,
      :auth => {
        :method => :simple,
        :username => "cn=students,ou=bind,dc=ldap,dc=iitm,dc=ac,dc=in",
        :password => "rE11Bg_oO~iC"
      }

      if ldap.bind
        filter = Net::LDAP::Filter.eq("uid", username)
        treebase = "dc=ldap, dc=iitm, dc=ac, dc=in"

        ldap.search(:base => treebase, :filter => filter) do |entry|
          puts "DN: #{entry.dn}"
          if entry.dn
            ldap1 = Net::LDAP.new
            ldap1.host = "ldap.iitm.ac.in"
            ldap1.port = 389
            ldap1.auth entry.dn, password
            if ldap1.bind
              @user = User.find_by(username: params[:session][:roll])
              if @user && @user[:hostel]=='GANGA'
                sign_in @user
                redirect_to @user
                flash[:success] = "Welcome, #{@user[:fullname]}"
              else
                redirect_to signin_path
                flash[:error] = "Sorry, but the following is restricted to Gangasters only..."
              end
            end
          else
            redirect_to signin_path, :flash => {:error => "Invalid username or password"}
          end
        end
      end
  end


  def destroy
    sign_out 
    redirect_to root_url
  end

end
