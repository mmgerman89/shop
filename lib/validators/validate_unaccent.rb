class ValidateUnaccent < ActiveModel::Validator
	def validate(record)
		records = options[:model].all
		action_name = options[:action_name]
		cant = 0
		records.each do |r|
			if I18n.transliterate(r.name.downcase) == I18n.transliterate(record.name.downcase)
				cant += 1
			end
		end
		
		case
		when action_name == 'create' && cant > 0
			record.errors[:name] << 'Ya Existe'
		when action_name == 'update' && cant > 1
			record.errors[:name] << 'Ya Existe'
		end
	end
end