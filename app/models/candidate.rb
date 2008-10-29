class Candidate < ActiveRecord::Base
  validates_presence_of     :first_name, :last_name
  #validates_uniqueness_of   :first_name, :last_name
  
  def validate
    #errors.add_to_base("Već postoji taj kandidat") if first_name == Candidate.find_by_first_name(first_name).first_name and last_name == Candidate.find_by_last_name(last_name).last_name
    
  end
  
end
