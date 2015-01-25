module FormationStepsHelper

def type(tipo)
  if tipo == 'AF'
    'Física'
  else
    'Moral'
  end
end


  # def heading_search(name)
  #    "Apertura de #{name}"
  #  end

   
  #  def subheading_search(type)
  #    "Para persona #{type == 'AF'? 'física' : 'moral'}"
  #  end

end