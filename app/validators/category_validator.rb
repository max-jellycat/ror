class CategoryValidator < ActiveModel::Validator
  def validate(record)
    if record.title.nil? || record.title.empty?
      record.errors.add(:title, :is_empty, { message: "タイトルは空にできません" })
    end
  end
end