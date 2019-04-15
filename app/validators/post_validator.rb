class PostValidator < ActiveModel::Validator
  def validate(record)
    if record.title.nil? || record.title.length < 1
      record.errors.add(:title, :is_empty, { message: "タイトルは空にできません" })
    end

    if record.content.nil? || record.content.length < 10
      record.errors.add(:title, :too_short, { message: "コンテンツは10文字以上でなければなりません" })
    end
  end
end