class Array   
  def to_hash     
    hash = {}     
    self.each {|e| hash[e] = (hash[e]? hash[e] + 1 : 1) }     
    hash   
  end 
end

class Hash   
  def to_inverse     
    ff = {}     
    self.each do |k, v|        
      if ff[v]
        ff[v] += 1       
      else         
        ff[v] = 1       
      end     
    end     
    ff
  end 
end