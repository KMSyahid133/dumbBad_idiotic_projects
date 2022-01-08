#---------------------------------------------------------------------------------------------

#return the highest number
def max(*arguments): #return: number
    highest = 1
    for x in arguments:
        if x >= highest:
            highest = x
    return highest

#---------------------------------------------------------------------------------------------

#returns the lowest number 
def min(*arguments):
    lowest = 1
    for x in arguments:
        if lowest > x:
            lowest = x
    return lowest

#return string
def percentage(value, total):
    percentage = value / total
    total_percentage = percentage * 100

    return str(total_percentage) + "%"

#---------------------------------------------------------------------------------------------

#why is this here?
def clamp(x, min, max):
    if min >= max:
        print("Syntax Error: 2nd argument(min), must be lower than 3rd argument(max)")

    if x >= min and x <= max:
        return x
    elif x <= min:
        return min
    elif x >= max:
        return max

#---------------------------------------------------------------------------------------------


#return the average value
def mean(*args): #Return: float
    if type(args[0]) is list or type(args[0]) is tuple:
        lists = args[0]
        sum = 0
        for x in range(len(lists)):
            sum += lists[x]
        
        return sum / len(lists)
    else:
        sum = 0
        for x in range(len(args)):
            sum += args[x]
        return sum / len(args)

#---------------------------------------------------------------------------------------------

#The middle data of set data value (there must be a more efficent way of doing this (*ahem* numpy *ahem*))
def median(*args):

    #For lists or tuple
    if type(args[0]) is list or type(args[0]) is tuple:
        lists = args[0]
        if len(lists) % 2 == 0: #odd length of lists
            lists = args[0]
            length = len(lists)
            half_one = lists[int((length - 1) / 2)]
            half_two = lists[int((length + 1) / 2)]
            return (half_one + half_two) / 2
            
        else: #Even length of lists
            return lists[int(len(lists) / 2)]
    else:
        #new_list = []

        #for i in range(len(args)):
        #   new_list.append(args[i])

        #length = len(new_list)
        length = len(args)
        print(f"Length: {length}")

        if int(length) % 2 == 0:
            half_one = args[int((length - 1) / 2)]
            half_two = args[int((length + 1) / 2)]
            return (half_one + half_two) / 2
        else:
            return args[int(length / 2)]
            #return new_list[int(length / 2)]
            
#---------------------------------------------------------------------------------------------

#square a number 
def square(x):
    return x ** 2
#---------------------------------------------------------------------------------------------

#return the highest number
def max(*arguments): #return: number
    highest = 1
    for x in arguments:
        if x >= highest:
            highest = x
    return highest

#---------------------------------------------------------------------------------------------

#returns the lowest number 
def min(*arguments):
    lowest = 1
    for x in arguments:
        if lowest > x:
            lowest = x
    return lowest

#return string
def percentage(value, total):
    percentage = value / total
    total_percentage = percentage * 100

    return str(total_percentage) + "%"

#---------------------------------------------------------------------------------------------

#why is this here?
def clamp(x, min, max):
    if min >= max:
        print("Syntax Error: 2nd argument(min), must be lower than 3rd argument(max)")

    if x >= min and x <= max:
        return x
    elif x <= min:
        return min
    elif x >= max:
        return max

#---------------------------------------------------------------------------------------------


#return the average value
def mean(*args): #Return: float
    if type(args[0]) is list or type(args[0]) is tuple:
        lists = args[0]
        sum = 0
        for x in range(len(lists)):
            sum += lists[x]
        
        return sum / len(lists)
    else:
        sum = 0
        for x in range(len(args)):
            sum += args[x]
        return sum / len(args)

#---------------------------------------------------------------------------------------------

#The middle data of set data value (there must be a more efficent way of doing this (*ahem* numpy *ahem*))
def median(*args):

    #For lists or tuple
    if type(args[0]) is list or type(args[0]) is tuple:
        lists = args[0]
        if len(lists) % 2 == 0: #odd length of lists
            lists = args[0]
            length = len(lists)
            half_one = lists[int((length - 1) / 2)]
            half_two = lists[int((length + 1) / 2)]
            return (half_one + half_two) / 2
            
        else: #Even length of lists
            return lists[int(len(lists) / 2)]
    else:
        #new_list = []

        #for i in range(len(args)):
        #   new_list.append(args[i])

        #length = len(new_list)
        length = len(args)
        print(f"Length: {length}")

        if int(length) % 2 == 0:
            half_one = args[int((length - 1) / 2)]
            half_two = args[int((length + 1) / 2)]
            return (half_one + half_two) / 2
        else:
            return args[int(length / 2)]
            #return new_list[int(length / 2)]
            
#---------------------------------------------------------------------------------------------

#square a number 
def square(x):
    return x ** 2
  
#---------------------------------------------------------------------------------------------
