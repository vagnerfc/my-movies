class Movie < ActiveRecord::Base
    belongs_to :director, class_name: "Director", foreign_key: "director_id",  optional: true
    has_and_belongs_to_many :actors, association_foreign_key: 'actor_id', join_table: 'actors_movies'
    has_many :movies, class_name: 'Movie' , foreign_key: 'director_id'
    has_many :classifications
    has_many :users, through: :classifications

def average_score
    classifications.average(:score).to_f
end

end
