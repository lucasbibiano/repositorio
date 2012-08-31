# -*- encoding : utf-8 -*-
class Representante::Athlete < ActiveRecord::Base
	belongs_to :organization, :class_name=>"Admin::Organization"
	has_and_belongs_to_many :competitions, :class_name=>"Admin::Competition",
	 :join_table => 'athletes_competitions'
	 
	attr_accessible :age, :name, :sex

	validates_presence_of :name

	#validacao numerica
	validates :age, :numericality => { :greater_than => 0,
	:message => "Apenas números maiores que 0 são permitidos" }

	#apenas masculino e feminino aceitos
	validates :sex, :inclusion => { :in => %w(Masculino Feminino),
    :message => "\"%{value}\" não é um valor válido para o sexo" }

	def details
		return name << " - " << age.to_s << " anos - " << sex
	end
end
