#Caesar Cypher 
#
# Calculation:
#   In range of 0 -> 25:
#       En(x:letter) = (x + N shift) % 26
#       Dn(x:letter) = (x - N shift) % 26

alphabets_upper = ("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", 
                   "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z")

alphabets_lower = ("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", 
                   "q", "r", "s", "t", "u", "v", "w", "x", "y", "z")

texts = {}

#---------------------------------------------------------------------------------------------------------
#dafaq is dis?
def get_index(alphabet, list, getList):
    for x in range(len(list)):
        if list[x] == alphabet:
            if getList:
                return x, list
            return x, None
    return None, None

#---------------------------------------------------------------------------------------------------------
#For a cleaner code
def get_info(current):
    a_char, a_list = get_index(current, alphabets_lower, True)
    b_char, b_list = get_index(current, alphabets_upper, True)
    if a_char and a_list:
        return a_char, a_list
    else:
        return b_char, b_list

#---------------------------------------------------------------------------------------------------------

def encrypt(shift, text):
    encrypted = ""

    for x in range(len(text)):
        current = text[x]
        char_index, list = get_info(current)
        if char_index:
            shift_index = (char_index + shift) % 26
            encrypted_char = list[shift_index]
            encrypted += encrypted_char
        else:
            encrypted += current
        
            
    return encrypted

#---------------------------------------------------------------------------------------------------------

def decrypt(shift, text):
    decrypted = ""
    for x in range(len(text)):
        current = text[x]
        char_index, list = get_info(current)
        if char_index:
            shift_index = (char_index - shift) % 26
            decrypted_char = list[shift_index]
            decrypted += decrypted_char
        else:
            decrypted += current
            
    return decrypted

#---------------------------------------------------------------------------------------------------------
