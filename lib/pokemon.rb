require 'pry'
class Pokemon
    attr_accessor :name, :type, :id, :db
    

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name 
        @type = type 
        @db = db
      end



      def self.save( name, type, db)
      
          sql = <<-SQL
                  INSERT INTO pokemon (name, type) 
                  VALUES (?, ?)
                SQL
    
          db.execute(sql, name, type)
        #   @id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemons")[0][0]
    
      end


      def self.find(id, db)
      
        sql = <<-SQL
                    SELECT *
                    FROM pokemon
                    WHERE id = ?
                  
              SQL
            #   binding.pry
       argument =  db.execute(sql, id)
        # binding.pry
        new_instance =  Pokemon.new(id: argument[0][0],name: argument[0][1], type: argument[0][2], db: db)
        new_instance
        # @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
       
  
    end
end
