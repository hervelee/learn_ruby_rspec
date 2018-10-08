# #write your code here
# def translate (str)
#   alpha = ('a'..'z').to_a
#   voyelles = %w[a e i o u]
#   consonants = alpha - voyelles

#   if voyelles.include?(str[0])
#     str + 'ay'
#   elsif consonants.include?(str[0]) && consonants.include?(str[1])
#     str[2..-1] + str[0..1] + 'ay'
#   elsif consonants.include?(str[0])
#     str[1..-1] + str[0] + 'ay'
#   elsif vowel?(first_letter=word[0].downcase)
#         word + 'ay' &&
  	
#   	vowel?(last_letter=word[-1].downcase)
#         move_last_letter(word) + 'ay'
  
#   end
# end	

def translate(str)
    str = str.downcase
    voyelles = ['a', 'e', 'i', 'o', 'u']
    word = str.split(' ')
  tab_result = []

word.each_with_index do |word, i|
    traduc = ''
    qu = false
    if voyelles.include? word[0]
        traduc = word + 'ay'
        tab_result.push(traduc)
        
    else
        word = word.split('')
        count = 0
        word.each_with_index do |char, index|
            if voyelles.include? char
                
                if char == 'u' and traduc[-1] == 'q'
                    qu = true
                    traduc = word[i][count + 1..word[i].length] + traduc + 'uay'
                    tab_result.push(traduc)
                    next
                end
                break
            else
             
                if char == 'q' and word[i+1] == 'u'
                    qu = true
                    traduc = word[i][count + 2..word[i].length] + 'quay'
                    tab_result.push(traduc)
                    next
                else
                    traduc += char
                end
                count += 1
            end
        end
     
        if not qu
            traduc = word[i][count..word[i].length] + traduc + 'ay'
            tab_result.push(traduc)
        end
    end

end
tab_result.join(' ')
end

