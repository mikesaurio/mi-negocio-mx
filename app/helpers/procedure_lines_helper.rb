module ProcedureLinesHelper
   def tipo(t)
            if t== 'TM'
             'Moral'
            elsif t == 'TF'
              'Física'
            else
              'Ambas'
            end
          end
end
