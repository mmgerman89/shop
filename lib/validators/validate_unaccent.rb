class ValidateUnaccent < ActiveModel::Validator
	def validate(record)
		records = options[:model].all
		records.each do |r|
			if I18n.transliterate(r.name.downcase) == I18n.transliterate(record.name.downcase) &&
				r.id != record.id
				record.errors[:name] << 'Ya Existe'
			end
		end
	end
end