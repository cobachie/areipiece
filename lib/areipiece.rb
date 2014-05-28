require "areipiece/version"
require "thor"
require "rubygems"
require "active_record"
require "yaml"

module Areipiece
  class SP < Thor
    
    desc "", ""
    def piece
      begin
        @app_root = Dir.getwd
        @gem_root = File.expand_path("../../templates", __FILE__)
        
        establish_database

        Dir.glob("#{@gem_root}/**/*").each do |file|
          if File::ftype(file) == "file" && File.extname(file) == ".yml"
            set_data(file)
          end
        end
        return true
      rescue => e
        puts "ERROR: " + e.message
        false
      end
    end
    
    private
    def establish_database
      config = YAML.load_file("#{@app_root}/config/database.yml")
      ActiveRecord::Base.establish_connection(config["production"])
    end
    
    def set_data(file)
      filename = File.basename(file, ".*")

      data = YAML.load_file(file)
      data["concept_id"] ||= 1
      data["site_id"] ||= 1
      data["state"] ||= "public"
      data["model"] ||= "Cms::Free"
      data["name"] ||= filename
      data["title"] ||= filename
      data["view_title"] ||= filename

      if CmsPiece.new.save_piece(data)
        puts "---> create #{filename}"
      else
        puts "---> skip #{filename}"
      end
      
    end
  end
  
  require "areipiece/cms_piece"
end
