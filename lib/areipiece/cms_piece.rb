module Areipiece
  
  class CmsPiece < ActiveRecord::Base

    def save_piece(data)
    
      return false if data.blank?
      
      return false unless CmsPiece.where(title: data["title"]).blank?
      
      @piece = CmsPiece.new
      @piece.concept_id = data["concept_id"]
      @piece.site_id = data["site_id"]
      @piece.state = data["state"]
      @piece.model = data["model"]
      @piece.name = data["name"]
      @piece.title = data["title"]
      @piece.view_title = data["view_title"]
      @piece.body = data["body"]
      @piece.save!
      
    end

  end
    
end
