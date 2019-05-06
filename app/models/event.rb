class Event < ApplicationRecord
	has_many :attendances
	has_many :users, through: :attendances
	belongs_to :admin, class_name: "User"

	# --------------- Validates des events ------------------
	validates :start_date, presence: true
	validate :cannot_change_the_past

	validates :duration, presence: true, numericality: {:greather_than => 0 }
	validate :multiple_of_5	

	validates :title, presence: true, length: { in: 5..140 }

	validates :description, presence: true, length: { in: 20..1000}

	validates :price, presence: true, length: { in: 1..1000}

	validates :location, presence: true

# Methode pour verifier la startdate de l'event,
# impossible de creer ou modifier un event passe.
def cannot_change_the_past
	if start_date.present? && start_date < Date.today
		errors.add(:start_date, "can't change a past event")
	end
end

# Methode pour verifier le format de la duree de l'event,
# impossible de creer sans que ce soit un multiple de 5.
def multiple_of_5
	if duration % 5 != 0
		errors.add(:duration, "it must be a multiple of 5")
	end
end

end
