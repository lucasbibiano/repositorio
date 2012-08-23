# -*- encoding : utf-8 -*-
class Admin::Competition < ActiveRecord::Base
	has_and_belongs_to_many :athletes, :class_name=>"Representante::Athlete",
	 :join_table => 'athletes_competitions'

	attr_accessible :max_age, :min_age, :name, :sex, :max_per_org

	#validacao de apenas numeros
	validates :max_age, :numericality => { :greater_than => 0,
	:message => "Apenas números maiores que 0 são permitidos" }
	validates :min_age, :numericality => { :greater_than => 0,
	:message => "Apenas números maiores que 0 são permitidos" }
    validates :max_per_org, :numericality => { :greater_than => 0,
	:message => "Apenas números maiores que 0 são permitidos" }

	#apenas masculino e feminino aceitos
	validates :sex, :inclusion => { :in => %w(Masculino Feminino),
    :message => "%{value} não é um valor válido para o sexo" }

    #validando presença
    validates_presence_of :name, :message => "Campo obrigatório"

    validate :idades_min_max

	def full_name
		return "" << name.to_s << " (" << min_age.to_s << " a " <<
		  max_age.to_s << " anos) " << " - " << sex.to_s
	end

	private
	def idades_min_max

		if !(max_age && min_age)
			return
		end

		if max_age < min_age
			errors.add(:max_age, "Idade máxima deve ser maior que a mínima") 
		end
	end
end
