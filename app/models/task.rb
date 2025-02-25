class Task < ApplicationRecord
  validates :title, presence: { message: "Le titre est obligatoire !" }
  validates :details, length: { minimum: 5, message: "Les détails doivent contenir au moins 5 caractères." }
end
