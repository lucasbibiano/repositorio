# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
	belongs_to :organization, :class_name=>"Admin::Organization"

	# Include default devise modules. Others available are:
	# :token_authenticatable, :confirmable,
	# :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :trackable, :validatable

	# Setup accessible (or protected) attributes for your model
	attr_accessible :organization_id, :email, :password, :password_confirmation, :remember_me, :is_admin
	# attr_accessible :title, :body

	#tamanho maximo pro nome
    validates_length_of :name, :minimum => 1, :maximum => 18,
     :message => "Campo deve ter entre 1 e 18 caracteres"

	def details
		return "Logado como " << email << " | " <<
		 (is_admin ? "Administrador" : "Representante") << " | " <<
		 (organization ? organization.name : "")
	end
end
