# -*- encoding : utf-8 -*-
class Admin::Organization < ActiveRecord::Base
	has_many :athletes, :class_name=>"Representante::Athlete", :dependent => :destroy
	has_many :users, :class_name=>"User", :dependent => :destroy

	attr_accessible :name

    #tamanho maximo pro nome
    validates_length_of :name, :minimum => 1, :maximum => 40,
     :message => "Campo deve ter entre 1 e 40 caracteres"
end
