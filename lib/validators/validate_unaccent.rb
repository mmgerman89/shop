class ValidateUnaccent < ActiveModel::Validator
	def validate(record)
		records = Category.all
		records.each do |r|
			if I18n.transliterate(r.name.downcase) == record.name.downcase
				record.errors[:name] << 'Ya existe ese nombre'
			end
		end
	end
end